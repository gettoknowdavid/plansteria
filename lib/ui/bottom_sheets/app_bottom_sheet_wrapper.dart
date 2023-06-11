import 'package:flutter/material.dart';

class AppBottomSheetWrapper extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsets? padding;
  const AppBottomSheetWrapper({
    super.key,
    required this.child,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: _BottomSheetPainter(
          height: height,
          borderRadius: 30,
          color: theme.primaryColor,
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(2, 2, 2, 0),
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _BottomSheetPainter extends CustomPainter {
  final double? height;
  final double borderRadius;
  final Color color;

  _BottomSheetPainter({
    this.height,
    required this.borderRadius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - borderRadius)
      ..quadraticBezierTo(
          size.width, size.height, size.width - borderRadius, size.height)
      ..lineTo(borderRadius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - borderRadius)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(
      path,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(_BottomSheetPainter oldDelegate) =>
      height != oldDelegate.height ||
      borderRadius != oldDelegate.borderRadius ||
      color != oldDelegate.color;
}
