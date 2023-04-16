import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final _navigationService = locator<NavigationService>();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isIos = theme.platform == TargetPlatform.iOS;

    return IconButton(
      onPressed: onTap ?? _navigationService.back,
      style: IconButton.styleFrom(
        padding: isIos ? const EdgeInsets.only(left: 10).r : null,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)).r,
          side: BorderSide(color: colorScheme.onBackground.withOpacity(0.3)),
        ),
      ),
      icon: const BackButtonIcon(),
    );
  }
}
