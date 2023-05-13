import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/profile/profile_avatar.dart';
import 'package:plansteria/ui/widgets/profile/profile_item.dart';
import 'package:plansteria/ui/widgets/profile/profile_stat_item.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    if (viewModel.isBusy) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            (kToolbarHeight * 1.2).verticalSpace,
            const ProfileAvatar(),
            20.verticalSpace,
            const _Name(),
            const _Email(),
            30.verticalSpace,
            const _Stats(),
            30.verticalSpace,
            ProfileItem(
              'Edit Profile',
              onTap: viewModel.showEditProfileBottomSheet,
              leadingIcon: PhosphorIcons.pencil,
            ),
            10.verticalSpace,
            ProfileItem(
              'Account',
              onTap: viewModel.navigateToAccountView,
              leadingIcon: PhosphorIcons.userCircle,
            ),
            10.verticalSpace,
            const ProfileItem(
              'Location: Lagos, NG',
              leadingIcon: PhosphorIcons.mapPin,
            ),
            10.verticalSpace,
            ProfileItem(
              'About Plansteria',
              leadingIcon: PhosphorIcons.info,
              onTap: viewModel.navigateToAboutView,
            ),
            10.verticalSpace,
            ProfileItem(
              'Logout',
              onTap: viewModel.logout,
              leadingIcon: PhosphorIcons.signOut,
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(context) => ProfileViewModel();
}

class _Name extends SelectorViewModelWidget<ProfileViewModel, String> {
  const _Name();

  @override
  Widget build(BuildContext context, String value) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      value,
      style: textTheme.titleLarge,
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }

  @override
  String selector(ProfileViewModel viewModel) => viewModel.user.name;
}

class _Email extends SelectorViewModelWidget<ProfileViewModel, String> {
  const _Email();

  @override
  Widget build(BuildContext context, String value) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      value,
      textAlign: TextAlign.center,
      style: textTheme.bodyMedium?.copyWith(
        fontStyle: FontStyle.italic,
        color: textTheme.bodyMedium?.color?.withOpacity(0.5),
      ),
    );
  }

  @override
  String selector(ProfileViewModel viewModel) => viewModel.user.email;
}

class _Stats extends ViewModelWidget<ProfileViewModel> {
  const _Stats();

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StreamBuilder<int>(
          stream: viewModel.numberOfCreatedEvents,
          builder: (context, snapshot) => GestureDetector(
            onTap: viewModel.viewAllEvents,
            child: ProfileStatItem(
              count: snapshot.data,
              label: 'Events',
              loading: snapshot.connectionState == ConnectionState.waiting,
            ),
          ),
        ),
        StreamBuilder<int>(
          stream: viewModel.followers,
          builder: (context, snapshot) => GestureDetector(
            onTap: viewModel.viewAllFollowers,
            child: ProfileStatItem(
              count: snapshot.data,
              label: 'Followers',
              loading: snapshot.connectionState == ConnectionState.waiting,
            ),
          ),
        ),
        StreamBuilder<int>(
          stream: viewModel.following,
          builder: (context, snapshot) => GestureDetector(
            onTap: viewModel.viewAllFollowing,
            child: ProfileStatItem(
              count: snapshot.data,
              label: 'Following',
              loading: snapshot.connectionState == ConnectionState.waiting,
            ),
          ),
        ),
      ],
    );
  }
}
