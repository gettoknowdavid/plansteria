import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/views/create_event/create_event_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CreateEventImageWidget extends ViewModelWidget<CreateEventViewModel> {
  const CreateEventImageWidget({super.key});

  @override
  Widget build(BuildContext context, CreateEventViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final padding = const EdgeInsets.fromLTRB(10, 8, 10, 8).r;
    final borderRadius = const BorderRadius.all(Radius.circular(20)).r;

    return InkWell(
      onTap: viewModel.getImages,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          height: 0.26.sh,
          width: 1.sw,
          color: theme.colorScheme.primary.withOpacity(0.2),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const _Carousel(),
              const _Dots(),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: padding,
                  margin: const EdgeInsets.all(kGlobalPadding).r,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(Radius.circular(10)).r,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        PhosphorIcons.camera,
                        size: 18.sp,
                        color: theme.colorScheme.onPrimary,
                      ),
                      6.horizontalSpace,
                      Text(
                        viewModel.images != null
                            ? 'Change Image'
                            : 'Select Image',
                        style: textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Carousel extends ViewModelWidget<CreateEventViewModel> {
  const _Carousel();

  @override
  Widget build(BuildContext context, CreateEventViewModel viewModel) {
    final _carouselController = CarouselController();
    final borderRadius = const BorderRadius.all(Radius.circular(20)).r;

    final images = viewModel.editing ? viewModel.photoUrls : viewModel.images;
    List<Widget> items = [];

    if (images == null) {
      return const SizedBox();
    }

    final length = images.length;

    for (var i = 0; i < length; i++) {
      items.add(Container(
        margin: const EdgeInsets.only(right: 10).r,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: viewModel.editing
              ? DecorationImage(
                  image: NetworkImage(viewModel.photoUrls[i]!),
                  fit: BoxFit.cover,
                )
              : DecorationImage(
                  image: FileImage(viewModel.images![i]),
                  fit: BoxFit.cover,
                ),
        ),
      ));
    }

    return CarouselSlider(
      items: items,
      carouselController: _carouselController,
      options: CarouselOptions(
        viewportFraction: 1,
        onPageChanged: (index, reason) => viewModel.setPhotoIndex(index),
      ),
    );
  }
}

class _Dots extends ViewModelWidget<CreateEventViewModel> {
  const _Dots();

  @override
  Widget build(BuildContext context, CreateEventViewModel viewModel) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (viewModel.images == null && !viewModel.editing) {
      return const SizedBox();
    }

    final images = viewModel.editing ? viewModel.photoUrls : viewModel.images;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3).r,
        color: isDark ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: images!.asMap().entries.map((entry) {
            return Container(
              width: 5.r,
              height: 5.r,
              margin: const EdgeInsets.symmetric(horizontal: 4).r,
              decoration: BoxDecoration(
                color: viewModel.currentIndex == entry.key
                    ? theme.colorScheme.primaryContainer
                    : theme.colorScheme.primary,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
