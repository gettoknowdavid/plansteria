import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/views/chat/chat_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChatTextFormField extends ViewModelWidget<ChatViewModel> {
  const ChatTextFormField({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(context, viewModel) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(12).r,
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          5.verticalSpace,
          if (viewModel.isBusy) ...[
            const _LoadingIndicator(),
            10.verticalSpace,
          ],
          TextFormField(
            maxLines: 5,
            minLines: 1,
            controller: controller,
            focusNode: focusNode,
            onFieldSubmitted: (value) {
              viewModel.sendMessage(textController: controller);
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
                  viewModel.sendMessage(textController: controller);
                },
                iconSize: 18.sp,
                color: theme.colorScheme.onBackground,
                icon: const Icon(PhosphorIcons.paperPlaneRight),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2.r,
      width: 100,
      child: const LinearProgressIndicator(),
    );
  }
}
