import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

final radius = 11.r;
final diameter = (radius * 2).r;
final offsetWidth = (diameter * 0.6).r;

class StackedAvatarWidget extends ViewModelWidget<HomeViewModel> {
  const StackedAvatarWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    List<Widget> positionedAvatars = [];

    return FutureBuilder<List<Guest?>>(
      future: viewModel.getGuests,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: diameter,
            width: diameter,
            color: Colors.grey[20],
          );
        }

        for (int i = 0; i < snapshot.data!.length; i++) {
          if (i < 3) {
            positionedAvatars.add(Positioned(
              left: i * offsetWidth,
              child: _Avatar(avatar: snapshot.data?[i]?.avatar),
            ));
          }
        }

        final numberOfListeners = snapshot.data?.length ?? 0;
        final numberMinus3 = numberOfListeners == 0 ? 0 : numberOfListeners - 3;
        final length = snapshot.data!.length > 3 ? 3 : snapshot.data!.length;

        if (snapshot.data?.isNotEmpty == true && snapshot.data!.length > 3) {
          positionedAvatars.add(Positioned(
            left: length * offsetWidth,
            child: _CountAvatar(count: numberMinus3),
          ));
        }

        return Container(
          height: diameter,
          padding: kGlobalHorizontalPadding,
          child: Stack(children: positionedAvatars),
        );
      },
    );
  }
}

class _Avatar extends StatelessWidget {
  final String? avatar;

  const _Avatar({this.avatar});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: radius - 1,
        backgroundImage: avatar != null ? NetworkImage(avatar!) : null,
        child: avatar == null ? const Icon(PhosphorIcons.user, size: 14) : null,
      ),
    );
  }
}

class _CountAvatar extends StatelessWidget {
  final int count;

  const _CountAvatar({required this.count});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: theme.colorScheme.primary,
        radius: radius - 1,
        child: AutoSizeText(
          '$count+',
          maxFontSize: 14,
          minFontSize: 9,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
