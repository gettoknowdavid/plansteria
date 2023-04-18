import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/widgets/chat/chat_widget.dart';
import 'package:stacked/stacked.dart';

import 'chat_viewmodel.dart';

class ChatView extends StackedView<ChatViewModel> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Flexible(
            child: ListView.separated(
              itemCount: viewModel.messages.length,
              separatorBuilder: (context, index) => 10.verticalSpace,
              itemBuilder: (context, index) {
                final chatIndex = viewModel.messages[index]["chatIndex"];
                final msg = viewModel.messages[index]["msg"];
                return ChatWidget(
                  chatIndex: int.parse('$chatIndex'),
                  msg: msg.toString(),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(12).r,
              constraints: BoxConstraints(
                maxHeight: 0.15.sh,
                minHeight: 0.05.sh,
                minWidth: 1.sw,
              ),
              alignment: Alignment.bottomCenter,
              child: TextFormField(
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: theme.colorScheme.background,
                  hintText: 'Write your message',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ).r,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    iconSize: 18.sp,
                    color: theme.colorScheme.onBackground,
                    icon: const Icon(PhosphorIcons.paperPlaneRight),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(context) => ChatViewModel();
}
