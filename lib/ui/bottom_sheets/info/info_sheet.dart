import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plansteria/ui/common/common.dart';
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

    return Container(
      padding: kGlobalHorizontalPadding,
      decoration: BoxDecoration(
        color: theme.bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          18.verticalSpace,
          Center(
            child: Container(
              height: 4.h,
              width: 40.r,
              decoration: BoxDecoration(
                color: theme.colorScheme.onBackground.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
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
