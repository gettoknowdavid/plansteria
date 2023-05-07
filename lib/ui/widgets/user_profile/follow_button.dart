import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/views/user_profile/user_profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FollowButton extends ViewModelWidget<UserProfileViewModel> {
  const FollowButton({super.key});

  @override
  Widget build(BuildContext context, UserProfileViewModel viewModel) {
    final theme = Theme.of(context);

    return Center(
      child: StreamBuilder<bool>(
        stream: viewModel.isFollowing,
        builder: (context, snapshot) {
          final isFollowing = snapshot.data == true;
          return OutlinedButton(
            onPressed: isFollowing ? viewModel.unFollow : viewModel.follow,
            style: OutlinedButton.styleFrom(
              foregroundColor: isFollowing
                  ? theme.colorScheme.onBackground
                  : theme.colorScheme.onPrimary,
              backgroundColor: isFollowing
                  ? theme.colorScheme.background
                  : theme.colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 30).r,
            ),
            child: Text(isFollowing ? 'Following' : 'Follow'),
          );
        },
      ),
    );
  }
}
