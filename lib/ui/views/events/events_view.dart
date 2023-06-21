import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/events_list_type.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/app_back_button.dart';
import 'package:plansteria/ui/widgets/empty_state.dart';
import 'package:plansteria/ui/widgets/event_card.dart';
import 'package:plansteria/ui/widgets/layout_app_bar.dart';
import 'package:plansteria/ui/widgets/section_title.dart';
import 'package:stacked/stacked.dart';

import 'events_viewmodel.dart';

class EventsView extends StackedView<EventsViewModel> {
  final bool fromProfileView;
  const EventsView({super.key, this.fromProfileView = false});

  @override
  Widget builder(context, viewModel, child) {
    if (viewModel.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (fromProfileView && viewModel.myEventsReady) {
      return RefreshIndicator.adaptive(
        onRefresh: viewModel.initialise,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 70.r,
            leading: const Center(child: AppBackButton()),
            title: const Text('My Events'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(kGlobalPadding).r,
            child: viewModel.myEvents.isNotEmpty
                ? _EventsList(events: viewModel.myEvents)
                : const EmptyState(),
          ),
        ),
      );
    }

    return RefreshIndicator.adaptive(
      onRefresh: viewModel.initialise,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: LayoutAppBar(),
        ),
        body: SingleChildScrollView(
          padding: kGlobalHorizontalPadding,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (viewModel.myEventsReady && viewModel.myEvents.isNotEmpty)
                SectionTitle(
                  'My Events',
                  child: _EventsList(events: viewModel.myEvents),
                  onTap: () => viewModel.onSeeMore(EventsListType.myEvents),
                ),
              20.verticalSpace,
              if (viewModel.attendingEventsReady &&
                  viewModel.attendingEvents.isNotEmpty)
                SectionTitle(
                  "Attending",
                  child: _EventsList(events: viewModel.attendingEvents),
                  onTap: () =>
                      viewModel.onSeeMore(EventsListType.attendingEvent),
                ),
              20.verticalSpace,
              if (viewModel.attendedEventsReady &&
                  viewModel.attendedEvents.isNotEmpty)
                SectionTitle(
                  "Attended",
                  child: _EventsList(events: viewModel.attendedEvents),
                  onTap: () =>
                      viewModel.onSeeMore(EventsListType.attendedEvents),
                ),
              20.verticalSpace,
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.navigateToCreateEvent,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  EventsViewModel viewModelBuilder(BuildContext context) => EventsViewModel();
}

class _EventsList extends ViewModelWidget<EventsViewModel> {
  final List<Event?> events;
  const _EventsList({required this.events});

  @override
  Widget build(BuildContext context, EventsViewModel viewModel) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
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
