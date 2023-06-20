import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/events_list_type.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/app_back_button.dart';
import 'package:plansteria/ui/widgets/event_card.dart';
import 'package:stacked/stacked.dart';

import 'more_events_viewmodel.dart';

class MoreEventsView extends StackedView<MoreEventsViewModel> {
  final EventsListType listType;
  const MoreEventsView({super.key, required this.listType});

  @override
  Widget builder(context, viewModel, child) {
    if (!viewModel.dataReady && viewModel.isBusy) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.r,
        leading: const Center(child: AppBackButton()),
        title: Text(viewModel.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kGlobalPadding).r,
        child: _EventsList(events: viewModel.data!),
      ),
    );
  }

  @override
  MoreEventsViewModel viewModelBuilder(context) => MoreEventsViewModel();
}

class _EventsList extends ViewModelWidget<MoreEventsViewModel> {
  final List<Event?> events;
  const _EventsList({required this.events});

  @override
  Widget build(BuildContext context, MoreEventsViewModel viewModel) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index]!;
        return EventCard(
          event: event,
          onTap: () => viewModel.navigateToDetails(event),
        );
      },
    );
  }
}
