import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/profile/profile_avatar.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    if (viewModel.isBusy) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            20.verticalSpace,
            const ProfileAvatar(),
            20.verticalSpace,
            Text(
              viewModel.user!.name,
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              'Lagos, NG',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.textTheme.bodyLarge?.color?.withOpacity(0.5),
              ),
            ),
            20.verticalSpace,
            FilledButton(
              onPressed: viewModel.logout,
              child: const Text('LOGOUT'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(context) => ProfileViewModel();
}
