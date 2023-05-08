import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onTap, this.addColor = false});

  final void Function()? onTap;
  final bool addColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isIos = theme.platform == TargetPlatform.iOS;

    return IconButton(
      onPressed: onTap ?? () => Navigator.pop(context),
      style: IconButton.styleFrom(
        padding: isIos ? const EdgeInsets.only(left: 10).r : null,
        backgroundColor: addColor ? colorScheme.background : null,
        foregroundColor: addColor ? colorScheme.onBackground : null,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)).r,
          side: BorderSide(color: colorScheme.onBackground.withOpacity(0.3)),
        ),
      ),
      icon: const BackButtonIcon(),
    );
  }
}
