import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final isReady = viewModel.dataReady;
    final isNotEmpty = viewModel.data?.isEmpty == false;

    if (!isReady) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (fromProfileView && isReady) {
      return Scaffold(
        appBar: AppBar(
          leadingWidth: 70.r,
          leading: const Center(child: AppBackButton()),
          title: const Text('My Events'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(kGlobalPadding).r,
          child: isNotEmpty ? _buildList(viewModel) : const EmptyState(),
        ),
      );
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: LayoutAppBar(),
      ),
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isReady && isNotEmpty)
              SectionTitle(
                title: 'My Events',
                child: _buildList(viewModel),
              )
            else
              const EmptyState(),
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

  Widget _buildList(EventsViewModel viewModel) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemCount: viewModel.data!.length,
      itemBuilder: (context, index) {
        final event = viewModel.data![index]!;
        return EventCard(
          event: event,
          onTap: () => viewModel.navigateToDetails(event),
        );
      },
    );
  }

  @override
  EventsViewModel viewModelBuilder(BuildContext context) => EventsViewModel();
}
