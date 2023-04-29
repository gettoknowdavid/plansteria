import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/views/event_details/event_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

final _carouselController = CarouselController();

class EventDetailsHeader extends ViewModelWidget<EventDetailsViewModel> {
  const EventDetailsHeader({super.key});

  @override
  Widget build(BuildContext context, EventDetailsViewModel viewModel) {
    final theme = Theme.of(context);

    Widget? background;

    if (viewModel.data!.photoUrls.isEmpty) {
      background = Container(
        child: const Icon(PhosphorIcons.image),
        color: theme.primaryColor.withOpacity(0.5),
      );
    } else {
      background = Stack(
        alignment: Alignment.bottomCenter,
        children: const [_Carousel(), _Dots()],
      );
    }

    return FlexibleSpaceBar(background: background);
  }
}

class _Carousel extends ViewModelWidget<EventDetailsViewModel> {
  const _Carousel();

  @override
  Widget build(BuildContext context, EventDetailsViewModel viewModel) {
    final urls = viewModel.data!.photoUrls;
    List<Widget> items = [];

    if (urls.isEmpty) {
      return const SizedBox();
    }

    final length = urls.length;

    for (var i = 0; i < length; i++) {
      items.add(Image.network(
        urls[i]!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return const Center(child: CircularProgressIndicator());
        },
      ));
    }

    return CarouselSlider(
      items: items,
      carouselController: _carouselController,
      options: CarouselOptions(
        viewportFraction: 1,
        height: 0.32.sh,
        onPageChanged: (index, reason) => viewModel.setPhotoIndex(index),
      ),
    );
  }
}

class _Dots extends ViewModelWidget<EventDetailsViewModel> {
  const _Dots();

  @override
  Widget build(BuildContext context, EventDetailsViewModel viewModel) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3).r,
        color: isDark ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: viewModel.data!.photoUrls.asMap().entries.map((entry) {
            return Container(
              width: 6.r,
              height: 6.r,
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
