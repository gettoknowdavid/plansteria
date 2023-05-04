import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/number_helpers.dart';
import 'package:stacked/stacked.dart';

class ProfileStatItem extends StatelessWidget {
  final int? count;
  final String label;
  final bool loading;

  const ProfileStatItem({
    super.key,
    required this.count,
    required this.label,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SizedBox(
      width: (1.sw - 60) / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SkeletonLoader(
            loading: loading,
            child: Text(
              formatNumber(loading ? 0 : count!),
              maxLines: 1,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          2.verticalSpace,
          Text(
            label,
            style: textTheme.bodySmall,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
