import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/ui/views/event_details/event_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CreatorSection extends ViewModelWidget<EventDetailsViewModel> {
  const CreatorSection({super.key});

  @override
  Widget build(BuildContext context, EventDetailsViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return FutureBuilder<User?>(
      future: viewModel.getCreatorById,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return 0.horizontalSpace;
        }

        final creatorName = snapshot.data?.name;
        final avatar = snapshot.data?.avatar;

        return Row(
          children: [
            Container(
              height: 54.r,
              width: 54.r,
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(16)).r,
                image: avatar == null
                    ? null
                    : DecorationImage(
                        image: NetworkImage(avatar),
                        fit: BoxFit.cover,
                      ),
              ),
              child: avatar == null ? const Icon(PhosphorIcons.user) : null,
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('CREATED BY', style: textTheme.bodySmall),
                  Text('$creatorName', style: textTheme.bodyLarge)
                ],
              ),
            ),
            12.horizontalSpace,
            GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(PhosphorIcons.share),
                  4.verticalSpace,
                  Text('Share', style: textTheme.bodySmall),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
