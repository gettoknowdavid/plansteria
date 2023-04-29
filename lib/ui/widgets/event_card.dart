import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final void Function()? onTap;

  const EventCard({super.key, required this.event, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isDark = theme.brightness == Brightness.dark;

    final containerHeight = 0.22.sw;

    final date = DateFormat.MMMEd().format(event.date);
    final time = TimeOfDay.fromDateTime(event.startTime).format(context);

    final hasImageUrl = event.photoUrls.isNotEmpty;

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
              width: containerHeight,
              decoration: BoxDecoration(
                border: !hasImageUrl
                    ? Border.all(color: theme.colorScheme.primary)
                    : null,
                borderRadius: const BorderRadius.all(Radius.circular(10)).r,
                image: hasImageUrl
                    ? DecorationImage(
                        image: NetworkImage(event.photoUrls[0]!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: hasImageUrl ? null : const Icon(PhosphorIcons.image),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    event.name,
                    maxLines: 1,
                    minFontSize: 14,
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
                      color: theme.colorScheme.secondaryContainer,
                    ),
                  ),
                  AutoSizeText(
                    event.address,
                    maxLines: 1,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall,
                  ),
                  5.verticalSpace,
                  FutureBuilder<User>(
                    future: getCreatorById(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox(height: 16);
                      }

                      return AutoSizeText(
                        'by ${snapshot.data!.name}',
                        maxLines: 1,
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall,
                      );
                    },
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

  Future<User> getCreatorById() async {
    final snapshot = await userRef.doc(event.creatorId).get();
    return snapshot.data!;
  }
}
