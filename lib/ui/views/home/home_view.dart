import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/app_loading_indicator.dart';
import 'package:plansteria/ui/widgets/empty_state.dart';
import 'package:plansteria/ui/widgets/home/featured_event.dart';
import 'package:plansteria/ui/widgets/home/upcoming_events.dart';
import 'package:plansteria/ui/widgets/layout_app_bar.dart';
import 'package:plansteria/ui/widgets/section_title.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    if (viewModel.fetchingFeaturedEvent ||
        viewModel.fetchingUpcomingEvents ||
        !viewModel.upcomingReady) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (viewModel.featuredEvent == null && viewModel.upcomingEvents.isEmpty) {
      return const Scaffold(
        body: Center(child: EmptyState()),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: LayoutAppBar(bottom: _buildLoadingIndicator()),
      ),
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          children: [
            if (viewModel.featuredEvent != null) ...[
              SectionTitle(
                'Featured Event',
                child: LimitedBox(
                  maxHeight: 0.3.sh,
                  child: const FeaturedEvent(),
                ),
              ),
              20.verticalSpace,
            ],
            if (viewModel.dataReady(upcomingEventsKey) &&
                !viewModel.isUpcomingEmpty) ...[
              SectionTitle(
                'Upcoming Events',
                onTap: viewModel.onSeeMoreUpcoming,
                child: const UpcomingEvents(),
              ),
              20.verticalSpace,
            ] else ...[
              const EmptyState(),
              30.verticalSpace,
            ]
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
