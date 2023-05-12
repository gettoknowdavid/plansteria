import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/widgets/chat/chat_list.dart';
import 'package:plansteria/ui/widgets/chat/chat_text_form_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'chat_view.form.dart';
import 'chat_viewmodel.dart';

@FormView(fields: [FormTextField(name: 'message')])
class ChatView extends StackedView<ChatViewModel> with $ChatView {
  ChatView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          _buildClearButton(viewModel),
          10.horizontalSpace,
        ],
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          const Expanded(
            child: ChatList(),
          ),
          ChatTextFormField(
            controller: messageController,
            focusNode: messageFocusNode,
          )
        ],
      ),
    );
  }

  @override
  void onDispose(ChatViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(ChatViewModel viewModel) {
    viewModel.init();
    syncFormWithViewModel(viewModel);
  }

  @override
  ChatViewModel viewModelBuilder(context) => ChatViewModel();

  Widget _buildClearButton(ChatViewModel viewModel) {
    return Visibility(
      visible: viewModel.chatGroups.isNotEmpty,
      child: TextButton(
        onPressed: viewModel.clearChatHistory,
        child: const Text('Clear Chat'),
      ),
    );
  }
}
