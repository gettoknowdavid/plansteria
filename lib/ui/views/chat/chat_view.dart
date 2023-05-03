import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/widgets/chat/chat_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'chat_view.form.dart';
import 'chat_viewmodel.dart';

@FormView(fields: [FormTextField(name: 'message')])
class ChatView extends StackedView<ChatViewModel> with $ChatView {
  ChatView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          TextButton(
            onPressed: viewModel.clearChatHistory,
            child: const Text('Clear Chat'),
          ),
          10.horizontalSpace,
        ],
      ),
      body: Column(
        children: [
          const Flexible(child: _ChatList()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(12).r,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  5.verticalSpace,
                  if (viewModel.isBusy) ...[
                    _buildLoadingIndicator(),
                    10.verticalSpace,
                  ],
                  TextFormField(
                    maxLines: 5,
                    minLines: 1,
                    controller: messageController,
                    focusNode: messageFocusNode,
                    onFieldSubmitted: (value) {
                      viewModel.sendMessage();
                      messageController.clear();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: theme.colorScheme.background,
                      hintText: 'Write your message',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ).r,
                      suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.sendMessage();
                          messageController.clear();
                        },
                        iconSize: 18.sp,
                        color: theme.colorScheme.onBackground,
                        icon: const Icon(PhosphorIcons.paperPlaneRight),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _buildLoadingIndicator() {
    return SizedBox(
      height: 2.r,
      width: 100,
      child: const LinearProgressIndicator(),
    );
  }

  // @override
  // void onDispose(ChatViewModel viewModel) {
  //   super.onDispose(viewModel);
  //   disposeForm();
  // }

  @override
  bool get disposeViewModel => false;

  @override
  bool get createNewViewModelOnInsert => false;

  @override
  void onViewModelReady(ChatViewModel viewModel) async {
    await viewModel.init();
    syncFormWithViewModel(viewModel);
  }

  @override
  ChatViewModel viewModelBuilder(context) => ChatViewModel();
}

class _ChatList extends ViewModelWidget<ChatViewModel> {
  const _ChatList();

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    return ListView.separated(
      controller: viewModel.controller,
      itemCount: viewModel.chats.length,
      itemBuilder: (context, i) => ChatWidget(message: viewModel.chats[i]!),
      separatorBuilder: (context, i) {
        final chats = viewModel.chats;
        final nChat = chats[i]; // new chat
        final pChat = i > 0 ? chats[i - 1] : null; // previous chats

        if (pChat == null || !isSameDay(nChat!.created, pChat.created)) {
          final dateText = DateFormat('MMMM d, yyyy').format(nChat!.created);
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 5).r,
            child: Text(dateText),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
