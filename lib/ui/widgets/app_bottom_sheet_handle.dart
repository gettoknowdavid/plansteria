import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomSheetHandle extends StatelessWidget {
  const AppBottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 5.r,
      width: 0.1.sw,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)).r,
        color: theme.colorScheme.primaryContainer.withOpacity(0.6),
      ),
    );
  }
}
