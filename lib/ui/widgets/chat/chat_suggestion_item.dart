import 'package:flutter/material.dart';

class ChatSuggestionItem extends StatelessWidget {
  const ChatSuggestionItem({
    super.key,
    this.onTap,
    required this.title,
  });

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final buttonStyle = TextButton.styleFrom(
      foregroundColor: colorScheme.onBackground,
      disabledForegroundColor: colorScheme.onBackground,
      backgroundColor: colorScheme.primary.withOpacity(0.4),
      disabledBackgroundColor: colorScheme.primary.withOpacity(0.4),
    );
    return TextButton(
      onPressed: onTap,
      style: buttonStyle,
      child: Text(title, textAlign: TextAlign.center),
    );
  }
}
