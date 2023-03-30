import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProviderIconButton extends StatelessWidget {
  const ProviderIconButton({
    super.key,
    required this.onTap,
    required this.assetName,
  });

  final void Function() onTap;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: colorScheme.background,
        fixedSize: Size(64.w, 40.h),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colorScheme.onBackground.withOpacity(0.3)),
          borderRadius: const BorderRadius.all(Radius.circular(10)).r,
        ),
      ),
      icon: Image.asset(assetName),
    );
  }
}
