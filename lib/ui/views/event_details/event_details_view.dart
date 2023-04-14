import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/common/time_helpers.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:plansteria/ui/widgets/event_details/creator_section.dart';
import 'package:readmore/readmore.dart';
import 'package:stacked/stacked.dart';

import 'event_details_viewmodel.dart';

class EventDetailsView extends StackedView<EventDetailsViewModel> {
  final Event event;
  const EventDetailsView({super.key, required this.event});

  @override
  Widget builder(context, viewModel, child) {
    final scrollController = ScrollController();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isDark = theme.brightness == Brightness.dark;

    final date = DateFormat.yMMMEd().format(event.date);
    final time = eventDetailsTimeFormatter(event.startTime, event.endTime);

    final currency = NumberFormat.currency(locale: 'en_NG', symbol: '₦');

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: NestedScrollView(
        controller: scrollController,
        body: SingleChildScrollView(
          controller: scrollController,
          padding: kEventDetailsHorPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              10.verticalSpace,
              Text(
                event.eventName,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              16.verticalSpace,
              _DetailItem(
                icon: PhosphorIcons.calendar,
                title: date,
                subtitle: time,
              ),
              16.verticalSpace,
              _DetailItem(
                icon: PhosphorIcons.mapPin,
                title: event.eventAddress,
                subtitle: 'View on Map',
              ),
              20.verticalSpace,
              if (event.description != null) ...[
                Text(
                  'About this event',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ReadMoreText(
                  event.description!,
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
              if (event.notes != null) ...[
                Text(
                  'Please note',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ReadMoreText(
                  event.notes!,
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
              if (event.price == null) ...[
                Text(
                  'Ticket Price',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${currency.format(20000)} per person',
                  style: textTheme.bodyMedium,
                ),
                10.verticalSpace,
              ],
              10.verticalSpace,
              AppButton(onPressed: () {}, title: 'Get Tickets')
            ],
          ),
        ),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              expandedHeight: 0.32.sh,
              forceElevated: innerBoxIsScrolled,
              iconTheme: theme.iconTheme.copyWith(color: Colors.white),
              actionsIconTheme: theme.iconTheme.copyWith(color: Colors.white),
              flexibleSpace: const _Header(),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(90),
                child: CreatorSection(),
              ),
            ),
          ];
        },
      ),
    );
  }

  @override
  void onViewModelReady(EventDetailsViewModel viewModel) {
    viewModel.init(event);
  }

  @override
  EventDetailsViewModel viewModelBuilder(context) => EventDetailsViewModel();
}

class _DetailItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _DetailItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      children: [
        Container(
          height: 40.r,
          width: 40.r,
          decoration: BoxDecoration(
            color: theme.primaryColor.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(14)),
          ),
          child: Icon(
            icon,
            color: theme.iconTheme.color?.withOpacity(0.5),
          ),
        ),
        12.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              minFontSize: 13,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(subtitle, style: textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}

class _Header extends SelectorViewModelWidget<EventDetailsViewModel, String?> {
  const _Header();

  @override
  Widget build(BuildContext context, String? value) {
    return FlexibleSpaceBar(
      background: Hero(
        tag: 'event-image',
        child: Container(
          foregroundDecoration: const BoxDecoration(
            color: Colors.black26,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/tec-conference.jpg'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  String? selector(viewModel) => viewModel.event.eventImageUrl;
}
