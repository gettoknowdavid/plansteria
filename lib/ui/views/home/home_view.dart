import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:plansteria/models/event.dart';
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
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          children: [
            20.verticalSpace,
            const FeaturedEvent(),
            20.verticalSpace,
            const UpcomingEvents(),
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
}

class FeaturedEvent extends ViewModelWidget<HomeViewModel> {
  const FeaturedEvent({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Featured Event',
          style: textTheme.titleMedium?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        10.verticalSpace,
        Container(
          height: 0.36.sh,
          width: 1.sw,
          decoration: BoxDecoration(
            color:
                viewModel.fetchingFeaturedEvent ? Colors.white12 : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(24)).r,
          ),
          child: viewModel.fetchingFeaturedEvent
              ? null
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: (0.36.sh * 0.65),
                          width: 1.sw,
                          foregroundDecoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)).r,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)).r,
                            image: viewModel.fetchedEvent.eventImageUrl == null
                                ? null
                                : DecorationImage(
                                    image: NetworkImage(
                                      viewModel.fetchedEvent.eventImageUrl!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: 40.r,
                            width: 40.r,
                            margin: const EdgeInsets.all(16).r,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ).r,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${viewModel.fetchedEvent.date.day}',
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: Colors.black,
                                    height: 1.r,
                                  ),
                                ),
                                Text(
                                  DateFormat.MMM()
                                      .format(viewModel.fetchedEvent.date),
                                  style: textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    height: 1.r,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: kGlobalHorizontalPadding,
                      child: Text(
                        viewModel.fetchedEvent.eventName,
                        style: textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: kGlobalHorizontalPadding,
                      child: Text(
                        'Three Mils Island',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Expanded(child: StackedAvatarWidget()),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            fixedSize: Size(100.w, 42.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(24),
                                topLeft: Radius.circular(24),
                              ).r,
                            ),
                          ),
                          child: Text(
                            'Attending',
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const Spacer(),
                  ],
                ),
        ),
      ],
    );
  }
}

class StackedAvatarWidget extends ViewModelWidget<HomeViewModel> {
  
  const StackedAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<String> avatarUrls = [
      'assets/tec-conference.jpg',
      'assets/tec-conference.jpg',
      'assets/tec-conference.jpg',
    ];

    List<Widget> positionedAvatars = [];

    for (int i = 0; i < 3; i++) {
      positionedAvatars.add(
        Positioned(
          left: i * 22.0.r,
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundImage: AssetImage(avatarUrls[i]),
              radius: 14.r,
            ),
          ),
        ),
      );
    }

    positionedAvatars.add(
      Positioned(
        left: 3 * 22.0.r,
        child: CircleAvatar(
          radius: 15.r,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundColor: theme.colorScheme.primary,
            radius: 14.r,
            child: AutoSizeText(
              '100+',
              maxFontSize: 14,
              minFontSize: 9,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );

    return FutureBuilder<List<Guest?>>(
      future: ,
      builder: (context, snapshot) {
        return Container(
          height: 30.r,
          padding: kGlobalHorizontalPadding,
          child: Stack(children: positionedAvatars),
        );
      }
    );
  }
}

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
        if (viewModel.dataReady(allEventsKey))
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            separatorBuilder: (context, index) => 16.verticalSpace,
            itemCount: viewModel.fetchedList.length,
            itemBuilder: (context, index) {
              final event = viewModel.fetchedList[index]!;
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
