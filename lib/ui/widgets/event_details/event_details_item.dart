import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const EventDetailsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      children: [
        Container(
          height: 40.r,
          width: 40.r,
          decoration: BoxDecoration(
            color: theme.primaryColor.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(14)),
          ),
          child: Icon(
            icon,
            color: theme.iconTheme.color?.withOpacity(0.5),
          ),
        ),
        12.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              minFontSize: 13,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(subtitle, style: textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}
