import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bottomSheetTheme = theme.bottomSheetTheme;

    final handleSize = bottomSheetTheme.dragHandleSize ?? const Size(32, 4);

    return Semantics(
      label: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      container: true,
      child: SizedBox(
        height: kMinInteractiveDimension,
        width: kMinInteractiveDimension,
        child: Center(
          child: Container(
            height: handleSize.height,
            width: handleSize.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: colorScheme.onSurfaceVariant.withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }
}
