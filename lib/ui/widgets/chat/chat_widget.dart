import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/common/app_constants.dart';

class ChatWidget extends StatelessWidget {
  final String msg;
  final int chatIndex;

  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUser = chatIndex == 0;

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
                radius: 12.r,
                backgroundColor: isUser ? Colors.purple : Colors.pink,
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
