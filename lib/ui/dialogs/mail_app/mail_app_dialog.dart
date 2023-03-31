import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'mail_app_dialog_model.dart';

class MailAppDialog extends StackedView<MailAppDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const MailAppDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(context, viewModel, child) {
    return AlertDialog(
      title: const Text(kMailAppTitle, textAlign: TextAlign.center),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20).r,
        child: Column(
          children: [
            const Text(kMailAppDescription, textAlign: TextAlign.center),
            20.verticalSpace,
            request.data,
          ],
        ),
      ),
    );
  }

  @override
  MailAppDialogModel viewModelBuilder(context) => MailAppDialogModel();
}
