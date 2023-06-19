import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:plansteria/ui/common/app_strings.dart';
=======
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

class OnboardingPageModel extends StatelessWidget {
  final String title;
  final String body;
  final String asset;

  const OnboardingPageModel({
    Key? key,
    required this.title,
    required this.body,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
<<<<<<< HEAD
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            width: 1.sw,
            height: 0.15.sh,
            child: Image.asset(asset),
          ),
          60.verticalSpace,
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.verticalSpace,
          SizedBox(
            width: 0.65.sw,
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.primary.withOpacity(0.46),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  BorderRadius? getBorderRadius(String asset) {
    switch (asset) {
      case kOnboardingAsset1:
        return const BorderRadius.only(bottomLeft: Radius.circular(50)).r;
      case kOnboardingAsset3:
        return const BorderRadius.only(bottomRight: Radius.circular(50)).r;
      default:
        return null;
    }
  }
=======
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(asset, width: 0.7.sw, height: 0.7.sw),
        50.verticalSpace,
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0).r,
          child: Text(
            body,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge,
          ),
        ),
        const Spacer(),
      ],
    );
  }
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
}
