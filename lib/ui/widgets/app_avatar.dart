import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/layout/layout_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AppAvatar extends ViewModelWidget<LayoutViewModel> {
  const AppAvatar({super.key});

  @override
  Widget build(context, viewModel) {
    return GestureDetector(
      onTap: () => viewModel.handleNavigation(3),
      child: CircleAvatar(
        foregroundImage: viewModel.user.avatar != null
            ? NetworkImage(viewModel.user.avatar!)
            : null,
        child: viewModel.user.avatar == null
            ? const Icon(PhosphorIcons.user)
            : null,
      ),
    );
  }
}
