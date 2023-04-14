import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/views/event_details/event_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CreatorSection extends ViewModelWidget<EventDetailsViewModel> {
  const CreatorSection({super.key});

  @override
  Widget build(BuildContext context, EventDetailsViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      height: 90,
      width: 1.sw,
      padding: kEventDetailsHorPadding,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)).r,
      ),
      child: FutureBuilder<User?>(
        future: viewModel.getCreatorById,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return 0.horizontalSpace;
          }

          final creatorName = snapshot.data?.name;
          return Row(
            children: [
              Container(
                height: 54.r,
                width: 54.r,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/tec-conference.jpg'),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ).r,
                ),
              ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('CREATED BY', style: textTheme.bodySmall),
                  Text('$creatorName', style: textTheme.bodyLarge)
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
