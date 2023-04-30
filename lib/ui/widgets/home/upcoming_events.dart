import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/views/home/home_viewmodel.dart';
import 'package:plansteria/ui/widgets/event_card.dart';
import 'package:stacked/stacked.dart';

class UpcomingEvents extends ViewModelWidget<HomeViewModel> {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
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
        if (viewModel.dataReady(upcomingEventsKey))
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            separatorBuilder: (context, index) => 16.verticalSpace,
            itemCount: viewModel.upcomingEvents.length,
            itemBuilder: (context, index) {
              final event = viewModel.upcomingEvents[index]!;
              return EventCard(
                event: event,
                onTap: () => viewModel.navigateToDetails(event),
              );
            },
          ),
        20.verticalSpace,
      ],
    );
  }
}
