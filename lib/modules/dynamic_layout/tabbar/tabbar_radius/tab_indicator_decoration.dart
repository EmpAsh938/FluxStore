import 'package:flutter/material.dart';

class TabIndicatorDecoration extends BoxDecoration {
  final BoxPainter _painter;

  final double weight;
  final double radius;
  final double width;
  final Alignment alignment;
  final bool useRedDot;

  TabIndicatorDecoration({
    this.alignment = Alignment.center,
    super.color = Colors.white,
    this.weight = 1.5,
    this.radius = 5.0,
    this.width = 22.0,
    this.useRedDot = false,
  }) : _painter = TabIndicatorDecorationPainter(
          color: color ?? Colors.white,
          weight: weight,
          radius: radius,
          alignment: alignment,
          width: width,
          useRedDot: useRedDot,
        );

  @override
  BoxPainter createBoxPainter([Function()? onChanged]) => _painter;
}

class TabIndicatorDecorationPainter extends BoxPainter {
  final Paint _paint;
  final Color color;
  final double weight;
  final double radius;
  final double width;
  final Alignment alignment;
  final bool useRedDot;

  TabIndicatorDecorationPainter({
    required this.useRedDot,
    required this.alignment,
    required this.width,
    required this.color,
    required this.weight,
    required this.radius,
  }) : _paint = Paint()
          ..color = color
          ..isAntiAlias = true
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size!;
    const radius = 20.0;

    final pathStart = Path();

    // Top right
    pathStart.moveTo(offset.dx, offset.dy + radius);
    pathStart.arcToPoint(
      Offset(offset.dx + radius, offset.dy),
      radius: const Radius.circular(radius),
    );

    final sizeWidth = size.width / 2;
    final topLeftDx = offset.dx + sizeWidth - 21;

    // Top left
    pathStart.lineTo(topLeftDx, offset.dy);
    pathStart.quadraticBezierTo(
      topLeftDx - 15,
      offset.dy + 10,
      topLeftDx - 20 / 2 - 5,
      offset.dy + size.height / 2 + 5,
    );
    pathStart.quadraticBezierTo(
      topLeftDx - 18,
      offset.dy + size.height - 3,
      topLeftDx - (20 * 2),
      offset.dy + size.height,
    );

    // Bottom Right
    pathStart.lineTo(offset.dx + radius, offset.dy + size.height);
    pathStart.arcToPoint(
      Offset(offset.dx, offset.dy + size.height - radius),
      radius: const Radius.circular(radius),
    );
    pathStart.close();

    canvas.drawPath(pathStart, _paint);

    ///------------------------------------------------
    ///
    final pathEnd = Path();

    // Top right
    pathEnd.moveTo(offset.dx + size.width, offset.dy + radius);
    pathEnd.arcToPoint(
      Offset(offset.dx + size.width - radius, offset.dy),
      radius: const Radius.circular(radius),
      clockwise: false,
    );

    final topLeftEnd = offset.dx + sizeWidth + 21;
    // Top left
    pathEnd.lineTo(topLeftEnd, offset.dy);
    pathEnd.quadraticBezierTo(
      topLeftEnd + 15,
      offset.dy + 10,
      topLeftEnd + 20 / 2 + 5,
      offset.dy + size.height / 2 + 5,
    );
    pathEnd.quadraticBezierTo(
      topLeftEnd + 18,
      offset.dy + size.height - 3,
      topLeftEnd + (20 * 2),
      offset.dy + size.height,
    );

    // Bottom Right
    pathEnd.lineTo(offset.dx + size.width - radius, offset.dy + size.height);
    pathEnd.arcToPoint(
      Offset(offset.dx + size.width, offset.dy + size.height - radius),
      radius: const Radius.circular(radius),
      clockwise: false,
    );
    pathEnd.close();

    canvas.drawPath(pathEnd, _paint);
  }
}
