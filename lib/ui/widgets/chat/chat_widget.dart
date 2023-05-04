import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/chat.dart';
import 'package:plansteria/ui/views/chat/chat_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChatWidget extends ViewModelWidget<ChatViewModel> {
  final Chat chat;

  const ChatWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isUser = chat.role != "assistant";
    final background = isUser ? colorScheme.primary : colorScheme.secondary;
    final foreground = isUser ? colorScheme.onPrimary : colorScheme.onSecondary;

    final avatar = viewModel.user.avatar;
    final hasAvatar = avatar != null;

    final icon = isUser
        ? Icon(PhosphorIcons.user, size: 14.sp)
        : Icon(PhosphorIcons.robot, size: 14.sp);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10).r,
          color: isUser
              ? theme.colorScheme.onBackground.withOpacity(0.15)
              : theme.scaffoldBackgroundColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 10.r,
                backgroundColor: background,
                foregroundColor: foreground,
                foregroundImage: hasAvatar ? NetworkImage(avatar) : null,
                child: !hasAvatar ? icon : null,
              ),
              10.horizontalSpace,
              // if (chat.hasAnimated == false && chat.role == 'assistant')
              //   Expanded(
              //     child: AnimatedTextKit(
              //       isRepeatingAnimation: false,
              //       repeatForever: false,
              //       totalRepeatCount: 1,
              //       animatedTexts: [TyperAnimatedText(chat.content.trim())],
              //       onFinished: () => viewModel.timer?.cancel(),
              //     ),
              //   )
              // else
              Expanded(child: Text(chat.content.trim())),
            ],
          ),
        )
      ],
    );
  }
}
