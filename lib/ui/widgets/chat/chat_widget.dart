import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/views/chat/chat_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChatWidget extends ViewModelWidget<ChatViewModel> {
  final String msg;
  final int chatIndex;

  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isUser = chatIndex == 0;
    final background = isUser ? colorScheme.primary : colorScheme.secondary;
    final foreground = isUser ? colorScheme.onPrimary : colorScheme.onSecondary;

    final avatar = viewModel.user.avatar;
    final hasAvatar = avatar != null;

    final icon = isUser
        ? Icon(PhosphorIcons.user, size: 16.sp)
        : Icon(PhosphorIcons.robot, size: 16.sp);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(kGlobalPadding).r,
          color: isUser
              ? theme.colorScheme.onBackground.withOpacity(0.2)
              : theme.scaffoldBackgroundColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 13.r,
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundColor: background,
                  foregroundColor: foreground,
                  foregroundImage: hasAvatar ? NetworkImage(avatar) : null,
                  child: !hasAvatar ? icon : null,
                ),
              ),
              10.horizontalSpace,
              Expanded(child: Text(msg)),
              Visibility(
                visible: isUser,
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
