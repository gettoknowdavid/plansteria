import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileAvatar extends ViewModelWidget<ProfileViewModel> {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    final theme = Theme.of(context);
    final outerRadius = 0.24.r;
    final innerRadius = 0.23.r;

    return CircleAvatar(
      radius: outerRadius,
      backgroundColor: theme.primaryColor,
      child: CircleAvatar(
        radius: innerRadius,
        foregroundImage: viewModel.user?.avatar != null
            ? NetworkImage(viewModel.user!.avatar!)
            : null,
        child: viewModel.user?.avatar == null
            ? Icon(PhosphorIcons.user, size: innerRadius * 0.3)
            : null,
      ),
    );
  }
}
