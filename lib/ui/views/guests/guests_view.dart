import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/event.dart';
import 'package:stacked/stacked.dart';

import 'guests_viewmodel.dart';

class GuestsView extends StackedView<GuestsViewModel> {
  final Event event;
  const GuestsView({super.key, required this.event});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guests Lists'),
        bottom: !viewModel.isBusy ? null : _buildLoadingIndicator(),
      ),
      body: !viewModel.dataReady ? null : _buildList(viewModel),
    );
  }

  @override
  GuestsViewModel viewModelBuilder(context) => GuestsViewModel();

  ListView _buildList(GuestsViewModel viewModel) {
    return ListView.separated(
      separatorBuilder: (context, index) => _buildSeparator(context),
      itemCount: viewModel.data!.length,
      itemBuilder: (context, index) {
        final theme = Theme.of(context);
        final guest = viewModel.data![index]!;
        final hasAvatar = guest.avatar != null;
        return ListTile(
          title: Text(guest.name),
          leading: CircleAvatar(
            backgroundColor: theme.primaryColor,
            radius: 16.r,
            child: CircleAvatar(
              foregroundImage: hasAvatar ? NetworkImage(guest.avatar!) : null,
              radius: 15.r,
              child: !hasAvatar ? const Icon(PhosphorIcons.user) : null,
            ),
          ),
        );
      },
    );
  }

  Divider _buildSeparator(BuildContext context) {
    return Divider(
      color: Theme.of(context).dividerColor.withOpacity(0.3),
      endIndent: 14,
      indent: 14,
    );
  }

  PreferredSize _buildLoadingIndicator() {
    return PreferredSize(
      child: const LinearProgressIndicator(),
      preferredSize: Size.fromHeight(1.r),
    );
  }
}
