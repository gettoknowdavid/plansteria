import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
}
