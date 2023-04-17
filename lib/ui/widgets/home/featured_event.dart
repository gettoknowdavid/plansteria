import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/views/home/home_viewmodel.dart';
import 'package:plansteria/ui/widgets/home/stacked_avatar_widget.dart';
import 'package:stacked/stacked.dart';

class FeaturedEvent extends ViewModelWidget<HomeViewModel> {
  const FeaturedEvent({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final isBusy = viewModel.fetchingFeaturedEvent;

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
            color: isBusy ? Colors.white12 : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(24)).r,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.onBackground.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 4,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: !isBusy
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: const [
                        _EventImage(),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: _EventDate(),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const _EventName(),
                    const _CreatorName(),
                    const Spacer(),
                    const StackedAvatarWidget(),
                    const Spacer(),
                  ],
                )
              : null,
        ),
      ],
    );
  }
}

class _CreatorName extends StatelessWidget {
  const _CreatorName();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: kGlobalHorizontalPadding,
      child: Text(
        'Three Mils Island',
        style: textTheme.bodySmall?.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _EventDate extends SelectorViewModelWidget<HomeViewModel, DateTime> {
  const _EventDate();

  @override
  Widget build(BuildContext context, DateTime value) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
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
            '${value.day}',
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.black,
              height: 1.r,
            ),
          ),
          Text(
            DateFormat.MMM().format(value),
            style: textTheme.bodySmall?.copyWith(
              color: Colors.black,
              height: 1.r,
            ),
          ),
        ],
      ),
    );
  }

  @override
  DateTime selector(HomeViewModel viewModel) => viewModel.fetchedEvent!.date;
}

class _EventImage extends SelectorViewModelWidget<HomeViewModel, String?> {
  const _EventImage();

  @override
  Widget build(BuildContext context, String? value) {
    return Container(
      height: (0.36.sh * 0.65),
      width: 1.sw,
      foregroundDecoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)).r,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(24)).r,
        image: value != null
            ? DecorationImage(image: NetworkImage(value), fit: BoxFit.cover)
            : null,
      ),
    );
  }

  @override
  String? selector(viewModel) => viewModel.fetchedEvent!.eventImageUrl;
}

class _EventName extends SelectorViewModelWidget<HomeViewModel, String> {
  const _EventName();

  @override
  Widget build(BuildContext context, String value) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: kGlobalHorizontalPadding,
      child: Text(
        value,
        style: textTheme.titleMedium?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  String selector(viewModel) => viewModel.fetchedEvent!.eventName;
}
