import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plansteria/ui/bottom_sheets/app_bottom_sheet_wrapper.dart';
import 'package:plansteria/ui/widgets/app_bottom_sheet_handle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'info_sheet_model.dart';

class InfoSheet extends StackedView<InfoSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const InfoSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return AppBottomSheetWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(child: AppBottomSheetHandle()),
          18.verticalSpace,
          Text(
            request.title ?? 'Hello Stacked Sheet!!',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (request.description != null) ...[
            5.verticalSpace,
            Text(
              request.description!,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: GoogleFonts.roboto().fontFamily,
              ),
              maxLines: 3,
              softWrap: true,
            ),
          ],
          20.verticalSpace,
          FilledButton(
            onPressed: () => completer!(SheetResponse()),
            style: FilledButton.styleFrom(
              textStyle: theme.textTheme.labelLarge,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)).r,
              ),
            ),
            child: const Text('Okay'),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }

  @override
  InfoSheetModel viewModelBuilder(BuildContext context) => InfoSheetModel();
}
