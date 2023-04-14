import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/layout/layout_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'app_avatar.dart';

class LayoutAppBar extends ViewModelWidget<LayoutViewModel>
    with PreferredSizeWidget {
  final String? title;
  final Widget? action;
  final PreferredSizeWidget? bottom;

  LayoutAppBar({super.key, this.action, this.title, this.bottom});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, LayoutViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final leadingStyle = textTheme.titleMedium?.copyWith(fontSize: 14.r);

    // If th current view is the ProfileView show nothing
    if (viewModel.currentIndex == 3) {
      return const SizedBox();
    }

    return AppBar(
      leadingWidth: (kBottomNavigationBarHeight * 4).r,
      scrolledUnderElevation: 0.0,
      leading: Container(
        alignment: Alignment.centerLeft,
        padding: kGlobalHorizontalPadding,
        child: AutoSizeText(
          title ?? 'Hi, ${viewModel.firstName}',
          maxFontSize: 22,
          minFontSize: 18,
          style: leadingStyle?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        if (action != null) ...[
          action!,
          kGlobalPadding.horizontalSpace,
        ],
        const AppAvatar(),
        kGlobalPadding.horizontalSpace,
      ],
      bottom: bottom,
    );
  }
}
