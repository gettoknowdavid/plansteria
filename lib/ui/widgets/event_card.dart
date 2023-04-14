import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/ui/common/app_constants.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final void Function()? onTap;

  const EventCard({super.key, required this.event, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isDark = theme.brightness == Brightness.dark;

    final containerHeight = 0.24.sw;

    final date = DateFormat.MMMEd().format(event.date);
    final time = TimeOfDay.fromDateTime(event.startTime).format(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: theme.scaffoldBackgroundColor,
        height: containerHeight,
        width: 1.sw,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: containerHeight,
              width: 56.r,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)).r,
                image: const DecorationImage(
                  image: AssetImage(kPlaceHolerImageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    event.eventName,
                    maxLines: 2,
                    minFontSize: 16,
                    maxFontSize: 18,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.1.sp,
                    ),
                  ),
                  Text(
                    '$date at $time',
                    style: textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? theme.colorScheme.primary
                          : theme.colorScheme.secondary,
                    ),
                  ),
                  5.verticalSpace,
                  AutoSizeText(
                    event.eventAddress.toUpperCase(),
                    maxLines: 1,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            12.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
