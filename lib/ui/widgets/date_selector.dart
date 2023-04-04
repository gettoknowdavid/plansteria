import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 0.1.sh,
      padding: const EdgeInsets.fromLTRB(8, 10, 0, 10).r,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)).r,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ).r,
              ),
              child: Row(
                children: [
                  16.horizontalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Dec',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          '22',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.horizontalSpace,
                  Container(
                    height: 24,
                    width: 1,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  16.horizontalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wednesday',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '07:00 pm - 18:00 am',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.horizontalSpace,
                ],
              ),
            ),
          ),
          10.horizontalSpace,
          IconButton(
            onPressed: () {},
            icon: const Icon(PhosphorIcons.pencilLine),
          ),
          10.horizontalSpace,
        ],
      ),
    );
  }
}
