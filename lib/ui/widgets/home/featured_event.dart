import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/views/home/home_viewmodel.dart';
import 'package:plansteria/ui/widgets/home/stacked_avatar_widget.dart';
import 'package:stacked/stacked.dart';

final _containerHeight = 0.325.sh;
final _imageHeight = _containerHeight * 0.61.r;

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
          height: _containerHeight,
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
          child: Stack(
            children: [
              const _EventImage(),
              Positioned(
                top: _imageHeight + 5.r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _EventName(),
                    const _CreatorName(),
                    8.verticalSpace,
                    SizedBox(
                      width: 1.sw,
                      child: const StackedAvatarWidget(),
                    ),
                    2.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
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
      height: _imageHeight,
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
      child: Stack(
        children: const [
          Align(
            alignment: Alignment.bottomLeft,
            child: _EventDate(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: _FeatureTag(),
          ),
        ],
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
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
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

class _FeatureTag extends StatelessWidget {
  const _FeatureTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _imageHeight * 0.2.r,
      width: (_imageHeight * 0.25) * 0.52.r,
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(right: 30).r,
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 8).r,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(6)).r,
      ),
      child: Icon(
        PhosphorIcons.starFill,
        size: 12.sp,
        color: Colors.white,
      ),
    );
  }
}
