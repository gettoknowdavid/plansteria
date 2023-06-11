import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.onTap,
    this.child,
    this.textColor,
  });

  final String title;
  final void Function()? onTap;
  final Widget? child;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const Spacer(),
            if (onTap != null)
              TextButton(
                onPressed: onTap,
                child: Text('See all', style: textTheme.bodySmall),
              )
            else
              40.verticalSpace,
          ],
        ),
        child ?? const SizedBox(),
      ],
    );
  }
}
