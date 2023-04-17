import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/app_loading_indicator.dart';
import 'package:plansteria/ui/widgets/home/featured_event.dart';
import 'package:plansteria/ui/widgets/home/upcoming_events.dart';
import 'package:plansteria/ui/widgets/layout_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: LayoutAppBar(bottom: _buildLoadingIndicator()),
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          children: [
            20.verticalSpace,
            if (viewModel.fetchedEvent != null) const FeaturedEvent(),
            20.verticalSpace,
            const UpcomingEvents(),
            20.verticalSpace,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.navigateToCreateEvent,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();

  PreferredSize _buildLoadingIndicator() {
    return PreferredSize(
      preferredSize: Size.fromHeight(3.r),
      child: const AppLoadingIndicator<HomeViewModel>(addBottomSpace: false),
    );
  }
}
