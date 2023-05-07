import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.onTap,
    this.child,
  });

  final String title;
  final void Function() onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextButton(
              onPressed: onTap,
              child: Text('See all', style: textTheme.bodySmall?.copyWith()),
            )
          ],
        ),
        child ?? const SizedBox(),
      ],
    );
  }
}
