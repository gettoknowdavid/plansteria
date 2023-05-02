import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/widgets/chat/chat_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'chat_view.form.dart';
import 'chat_viewmodel.dart';

@FormView(fields: [FormTextField(name: 'message')])
class ChatView extends StackedView<ChatViewModel> with $ChatView {
  ChatView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Flexible(
            child: ListView.separated(
              controller: viewModel.listScrollController,
              itemCount: viewModel.messages.length,
              separatorBuilder: (context, index) => 4.verticalSpace,
              itemBuilder: (context, index) => ChatWidget(
                message: viewModel.messages[index]!,
              ),
            ),
          ),
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

  @override
  void onDispose(ChatViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(ChatViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  ChatViewModel viewModelBuilder(context) => ChatViewModel();
}
