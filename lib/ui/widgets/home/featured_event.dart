import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/creator.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/views/home/home_viewmodel.dart';
import 'package:plansteria/ui/widgets/home/stacked_avatar_widget.dart';
import 'package:stacked/stacked.dart';

// final _containerHeight = 0.3.sh;
// final _imageHeight = _containerHeight * 0.65.r;

class FeaturedEvent extends ViewModelWidget<HomeViewModel> {
  const FeaturedEvent({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);

    final isBusy = viewModel.fetchingFeaturedEvent;

    return GestureDetector(
      onTap: () => viewModel.navigateToDetails(viewModel.featuredEvent!),
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
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
              SkeletonLoader(
                loading: isBusy,
                child: _EventImage(height: constraints.maxHeight * 0.65),
              ),
              Positioned(
                top: (constraints.maxHeight * 0.65) + 5.r,
                right: 0,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _EventName(),
                    const _CreatorName(),
                    5.verticalSpace,
                    SizedBox(
                      width: 1.sw,
                      child: const StackedAvatarWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _CreatorName extends ViewModelWidget<HomeViewModel> {
  const _CreatorName();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: kGlobalHorizontalPadding,
      child: FutureBuilder<Creator>(
        future: viewModel.getCreator,
        builder: (context, snapshot) {
          return SkeletonLoader(
            loading: !snapshot.hasData,
            child: AutoSizeText(
              'by ${snapshot.data?.name}',
              maxLines: 1,
              minFontSize: 12,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          );
        },
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
  DateTime selector(HomeViewModel viewModel) => viewModel.featuredEvent!.date;
}

class _EventImage
    extends SelectorViewModelWidget<HomeViewModel, List<String?>?> {
  final double height;
  const _EventImage({required this.height});

  @override
  Widget build(BuildContext context, List<String?>? value) {
    return Container(
      height: height,
      width: 1.sw,
      foregroundDecoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)).r,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(24)).r,
        image: value != null
            ? DecorationImage(image: NetworkImage(value[0]!), fit: BoxFit.cover)
            : null,
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.bottomLeft,
            child: _EventDate(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: _FeatureTag(height: height),
          ),
        ],
      ),
    );
  }

  @override
  List<String?>? selector(viewModel) => viewModel.featuredEvent!.photoUrls;
}

class _EventName extends ViewModelWidget<HomeViewModel> {
  const _EventName();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: kGlobalHorizontalPadding,
      child: SkeletonLoader(
        loading: viewModel.fetchingFeaturedEvent,
        child: Text(
          viewModel.featuredEvent!.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _FeatureTag extends StatelessWidget {
  final double height;
  const _FeatureTag({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.2.r,
      width: (height * 0.25) * 0.52.r,
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(right: 30).r,
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 8).r,
      decoration: BoxDecoration(
        color: Colors.orange[700],
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
