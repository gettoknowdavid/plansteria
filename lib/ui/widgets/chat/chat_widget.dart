import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/message.dart';
import 'package:plansteria/ui/views/chat/chat_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChatWidget extends ViewModelWidget<ChatViewModel> {
  final Message message;

  const ChatWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isUser = message.index == 0;
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
              Expanded(
                child: isUser || !viewModel.shouldAnimate
                    ? Text(message.content.trim())
                    : AnimatedTextKit(
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        displayFullTextOnTap: true,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(message.content.trim())
                        ],
                      ),
              ),
              5.horizontalSpace,
              Visibility(
                visible: !isUser,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        PhosphorIcons.thumbsUp,
                        size: 16.sp,
                      ),
                    ),
                    10.horizontalSpace,
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        PhosphorIcons.thumbsDown,
                        size: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
