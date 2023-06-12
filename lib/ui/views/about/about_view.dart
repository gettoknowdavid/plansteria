import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/common.dart';
import 'package:stacked/stacked.dart';

import 'about_viewmodel.dart';

class AboutView extends StackedView<AboutViewModel> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final text = kAboutApp.replaceAll('\n', '\n\n');

    return Scaffold(
      appBar: AppBar(
        title: const Text('About CleanAir'),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kGlobalPadding).r,
        child: Text(text, style: textTheme.bodyMedium),
      ),
    );
  }

  @override
  AboutViewModel viewModelBuilder(context) => AboutViewModel();
}
