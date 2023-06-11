import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/place_suggestion.dart';
import 'package:plansteria/ui/bottom_sheets/app_bottom_sheet_wrapper.dart';
import 'package:plansteria/ui/widgets/app_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../drag_handle.dart';
import 'map_address_sheet.form.dart';
import 'map_address_sheet_model.dart';

@FormView(fields: [FormTextField(name: 'address')])
class MapAddressSheet extends StackedView<MapAddressSheetModel>
    with $MapAddressSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const MapAddressSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    return AppBottomSheetWrapper(
      padding: EdgeInsets.zero,
      child: Container(
        height: 0.5.sh,
        width: 1.sw,
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
        decoration: BoxDecoration(
          color:
              isLight ? Colors.white : theme.bottomSheetTheme.backgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(14)).r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const DragHandle(),
            AppTextField(
              hint: 'Search',
              label: 'Search',
              prefixIcon: const Icon(PhosphorIcons.magnifyingGlass),
              suffixIcon: const Icon(PhosphorIcons.xCircleFill),
              focusNode: addressFocusNode,
              controller: addressController,
              // onChanged: (value) => viewModel.getPlaces(value),
            ),
            20.verticalSpace,
            FutureBuilder<List<PlaceSuggestion?>>(
              future: viewModel.autoComplete(addressController.text),
              initialData: const [],
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: false,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index]!;
                        return ListTile(
                          title: Text(item.description),
                          onTap: () async {
                            final result =
                                await viewModel.getPlace(item.placeId);
                            completer!(
                              SheetResponse(confirmed: true, data: result),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return 0.verticalSpace;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(MapAddressSheetModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(MapAddressSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  MapAddressSheetModel viewModelBuilder(context) => MapAddressSheetModel();
}
