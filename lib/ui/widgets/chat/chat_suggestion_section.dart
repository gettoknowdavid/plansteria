import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/app_constants.dart';

class ChatSuggestionSection extends StatelessWidget {
  const ChatSuggestionSection({
    super.key,
    required this.content,
    required this.icon,
    required this.title,
  });

  final List<Widget> content;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kGlobalPadding).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              10.horizontalSpace,
              Text(title),
            ],
          ),
          10.verticalSpace,
          ...content,
        ],
      ),
    );
  }
}
