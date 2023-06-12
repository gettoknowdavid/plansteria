import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/creator.dart';
import 'package:plansteria/ui/views/event_details/event_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CreatorSection extends ViewModelWidget<EventDetailsViewModel> {
  const CreatorSection({super.key});

  @override
  Widget build(BuildContext context, EventDetailsViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: viewModel.navigateToUserProfile,
      child: Row(
        children: [
          FutureBuilder<Creator>(
            future: viewModel.getCreator(),
            builder: (context, snapshot) {
              return SkeletonLoader(
                loading: !snapshot.hasData,
                child: Container(
                  height: 54.r,
                  width: 54.r,
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(16)).r,
                    image: snapshot.data?.avatar == null
                        ? null
                        : DecorationImage(
                            image: NetworkImage(snapshot.data!.avatar!),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: snapshot.data?.avatar == null
                      ? const Icon(PhosphorIcons.user)
                      : null,
                ),
              );
            },
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('CREATED BY', style: textTheme.bodySmall),
                FutureBuilder<Creator>(
                  future: viewModel.getCreator(),
                  builder: (context, snapshot) {
                    return SkeletonLoader(
                      loading: !snapshot.hasData,
                      child: Text(
                        '${snapshot.data?.name}',
                        style: textTheme.bodyLarge,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
