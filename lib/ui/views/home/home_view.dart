import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/app_loading_indicator.dart';
import 'package:plansteria/ui/widgets/event_card.dart';
import 'package:plansteria/ui/widgets/layout_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: LayoutAppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.r),
          child: const AppLoadingIndicator<HomeViewModel>(
            addBottomSpace: false,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: kGlobalHorizontalPadding,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Upcoming Events',
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.verticalSpace,
                if (viewModel.dataReady)
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => 16.verticalSpace,
                    itemCount: viewModel.data!.length,
                    itemBuilder: (context, index) {
                      final event = viewModel.data![index]!;
                      return EventCard(
                        event: event,
                        onTap: () => viewModel.navigateToDetails(event),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.showCreateEventBottomSheet,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();
}
