import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_stats_viewmodel.dart';

class ProfileStatsView extends StackedView<ProfileStatsViewModel> {
  const ProfileStatsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileStatsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ProfileStatsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileStatsViewModel();
}
