import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final _navigationService = locator<NavigationService>();

    Widget icon = Theme.of(context).platform == TargetPlatform.iOS
        ? Icon(Icons.chevron_left, size: 32.r)
        : Icon(Icons.arrow_back, size: 32.r);

    return GestureDetector(
      onTap: onTap ?? _navigationService.back,
      child: Container(
        padding: EdgeInsets.zero,
        width: 50.r,
        height: 44.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorScheme.background,
          border: Border.all(color: colorScheme.onBackground.withOpacity(0.3)),
          borderRadius: const BorderRadius.all(Radius.circular(10)).r,
        ),
        child: icon,
      ),
    );
  }
}
