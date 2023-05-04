import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/views/chat/chat_viewmodel.dart';
import 'package:plansteria/ui/widgets/chat/chat_widget.dart';
import 'package:stacked/stacked.dart';

import 'chat_suggestions.dart';

class ChatList extends ViewModelWidget<ChatViewModel> {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    if (viewModel.chatGroups.isEmpty) {
      return const ChatSuggestions();
    }

    return ListView.builder(
      controller: viewModel.controller,
      itemCount: viewModel.chatGroups.keys.length,
      itemBuilder: (context, index) {
        final date = viewModel.chatGroups.keys.toList()[index];
        final chats = viewModel.chatGroups[date]!;

        return Column(
          children: [
            Text(date),
            5.verticalSpace,
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: chats.length,
              itemBuilder: (context, i) => ChatWidget(chat: chats[i]!),
            ),
          ],
        );
      },
    );
  }
}
