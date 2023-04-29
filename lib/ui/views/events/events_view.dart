import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/event_card.dart';
import 'package:plansteria/ui/widgets/layout_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'events_viewmodel.dart';

class EventsView extends StackedView<EventsViewModel> {
  const EventsView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: LayoutAppBar(),
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'My Events',
              style: textTheme.titleMedium?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            if (viewModel.dataReady)
              ListView.separated(
                shrinkWrap: true,
                primary: false,
                separatorBuilder: (context, index) => 16.verticalSpace,
                itemCount: viewModel.data.length,
                itemBuilder: (context, index) {
                  final event = viewModel.data[index]!;
                  return EventCard(
                    event: event,
                    onTap: () => viewModel.navigateToDetails(event),
                  );
                },
              ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  EventsViewModel viewModelBuilder(BuildContext context) => EventsViewModel();
}
