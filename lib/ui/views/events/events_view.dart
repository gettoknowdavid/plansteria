import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/app_back_button.dart';
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
    final isEmpty = viewModel.data?.isEmpty == true;

    return Scaffold(
      appBar: LayoutAppBar(),
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (fromProfileView && isReady) ...[
              20.verticalSpace,
              const AppBackButton(),
              10.verticalSpace,
              isEmpty ? _buildEmptyState(context) : _buildList(viewModel),
            ] else if (isReady && !isEmpty)
              SectionTitle(
                title: 'My Events',
                onTap: () {},
                child: _buildList(viewModel),
              )
            else
              _buildEmptyState(context),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Container _buildEmptyState(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 0).r,
      child: Text('Nothing to see here', style: textTheme.titleMedium),
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
