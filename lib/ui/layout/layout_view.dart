import 'package:flutter/material.dart';
import 'package:plansteria/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:stacked/stacked.dart';

import 'layout_viewmodel.dart';

class LayoutView extends StackedView<LayoutViewModel> {
  const LayoutView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      body: viewModel.getView,
      bottomNavigationBar: const AppBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.showCreateEventBottomSheet,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  LayoutViewModel viewModelBuilder(context) => LayoutViewModel();
}
