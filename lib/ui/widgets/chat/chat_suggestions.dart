import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/views/chat/chat_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'chat_suggestion_item.dart';
import 'chat_suggestion_section.dart';

class ChatSuggestions extends ViewModelWidget<ChatViewModel> {
  const ChatSuggestions({super.key});

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    List<Widget> exampleItems = [];
    List<Widget> limitationItems = [];

    for (var i = 0; i < viewModel.examples.length; i++) {
      exampleItems.addAll([
        ChatSuggestionItem(
          onTap: () => viewModel.sendMessage(viewModel.examples[i]),
          title: '"${viewModel.examples[i]}"',
        ),
        10.verticalSpace,
      ]);
    }

    for (var i = 0; i < viewModel.limitations.length; i++) {
      limitationItems.addAll([
        ChatSuggestionItem(title: viewModel.limitations[i]),
        10.verticalSpace,
      ]);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          10.verticalSpace,
          Text('AI Chat', style: textTheme.titleLarge),
          Text('Powered by OpenAI', style: textTheme.bodyMedium),
          20.verticalSpace,
          ChatSuggestionSection(
            title: 'Examples',
            icon: PhosphorIcons.sun,
            content: [...exampleItems],
          ),
          10.verticalSpace,
          ChatSuggestionSection(
            title: 'Limitations',
            icon: PhosphorIcons.warning,
            content: [...limitationItems],
          ),
        ],
      ),
    );
  }
}
