import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyState extends StatelessWidget {
  final String? message;
  const EmptyState({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Center(
          child: Image.asset('assets/empty-state.png', width: 0.8.sw),
        ),
        20.verticalSpace,
        Text(
          message ?? 'Nothing to see here',
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}
