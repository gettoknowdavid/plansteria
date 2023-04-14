import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/layout/layout_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AppAvatar extends ViewModelWidget<LayoutViewModel> {
  const AppAvatar({super.key});

  @override
  Widget build(context, viewModel) {
    return GestureDetector(
      onTap: () => viewModel.setIndex(3),
      child: const CircleAvatar(
        child: Icon(PhosphorIcons.user),
      ),
    );
  }
}
