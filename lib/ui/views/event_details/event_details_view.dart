import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/common/time_helpers.dart';
import 'package:plansteria/ui/widgets/app_back_button.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:plansteria/ui/widgets/event_details/creator_section.dart';
import 'package:plansteria/ui/widgets/event_details/event_details_header.dart';
import 'package:plansteria/ui/widgets/event_details/event_details_item.dart';
import 'package:readmore/readmore.dart';
import 'package:stacked/stacked.dart';

import 'event_details_viewmodel.dart';

class EventDetailsView extends StackedView<EventDetailsViewModel> {
  final Event event;
  const EventDetailsView({super.key, required this.event});

  @override
  Widget builder(context, viewModel, child) {
    if (viewModel.fetchingEvent || viewModel.fetchingIsAttending) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final data = viewModel.event;

    final scrollController = ScrollController();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final date = DateFormat.yMMMEd().format(data.date);
    final time = eventDetailsTimeFormatter(data.startTime, data.endTime);

    final currency = NumberFormat.currency(locale: 'en_NG', symbol: '₦');

    final isAttending = viewModel.isAttending;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: NestedScrollView(
        controller: scrollController,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          controller: scrollController,
          padding: kEventDetailsHorPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              20.verticalSpace,
              if (!viewModel.isAuthUser)
                const CreatorSection()
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: viewModel.onEditPressed,
                      icon: const Icon(PhosphorIcons.pencil),
                      label: const Text('Edit'),
                    ),
                    20.horizontalSpace,
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(PhosphorIcons.share),
                      label: const Text('Share'),
                    ),
                    20.horizontalSpace,
                    TextButton.icon(
                      onPressed: () => viewModel.onDeletePressed(event.uid),
                      icon: const Icon(PhosphorIcons.trash),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      label: const Text('Delete'),
                    )
                  ],
                ),
              24.verticalSpace,
              Text(
                data.name,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              16.verticalSpace,
              EventDetailsItem(
                icon: PhosphorIcons.calendar,
                title: date,
                subtitle: time,
              ),
              16.verticalSpace,
              EventDetailsItem(
                icon: PhosphorIcons.mapPin,
                title: data.address,
                subtitle: 'View on Map',
              ),
              16.verticalSpace,
              EventDetailsItem(
                icon: PhosphorIcons.ticket,
                title: viewModel.isPaid ? event.price!.toString() : 'Free',
                subtitle: 'Gate/Ticket Fee',
              ),
              16.verticalSpace,
              StreamBuilder<int>(
                stream: viewModel.numberOfGuestsStream,
                builder: (context, snapshot) {
                  return EventDetailsItem(
                    icon: PhosphorIcons.usersThree,
                    title: snapshot.hasData ? '${snapshot.data}' : 'Loading...',
                    subtitle: 'Number of guests',
                    onTap: viewModel.isAuthUser
                        ? viewModel.navigateToGuestsList
                        : null,
                  );
                },
              ),
              20.verticalSpace,
              if (data.description?.isNotEmpty == true) ...[
                Text(
                  'About this event',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ReadMoreText(
                  data.description!,
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: textTheme.bodySmall,
                  moreStyle: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.verticalSpace
              ],
              if (data.notes?.isNotEmpty == true) ...[
                Text(
                  'Please note',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ReadMoreText(
                  data.notes!,
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: textTheme.bodySmall,
                  moreStyle: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.verticalSpace,
              ],
              if (data.price != null) ...[
                Text(
                  'Ticket Price',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${currency.format(data.price)} per person',
                  style: textTheme.bodyMedium,
                ),
                10.verticalSpace,
              ],
              10.verticalSpace,
              if (!viewModel.isAuthUser)
                AppButton(
                  onPressed: isAttending
                      ? viewModel.onLeavePressed
                      : viewModel.onAttendPressed,
                  background: isAttending ? Colors.red : null,
                  foreground: isAttending ? Colors.white : null,
                  title: isAttending ? 'Leave' : 'Join',
                )
            ],
          ),
        ),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            leadingWidth: 70.w,
            expandedHeight: 0.32.sh,
            forceElevated: innerBoxIsScrolled,
            flexibleSpace: const EventDetailsHeader(),
            leading: const Center(child: AppBackButton(addColor: true)),
            iconTheme: theme.iconTheme.copyWith(color: Colors.white),
            actionsIconTheme: theme.iconTheme.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(EventDetailsViewModel viewModel) async {
    await viewModel.init();
  }

  @override
  EventDetailsViewModel viewModelBuilder(context) => EventDetailsViewModel();
}
