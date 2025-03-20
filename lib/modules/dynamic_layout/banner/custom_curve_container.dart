import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  final double height;
  final Color color;
  final double curveHeight;
  final Widget? child;

  const CurvedContainer({
    Key? key,
    required this.height,
    required this.color,
    this.curveHeight = 90, 
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: TopCurvedPainter(color: color, curveHeight: curveHeight),
        child: Container(
          child: child,
          width:double.infinity,
        ),
      ),
    );
  }
}

class TopCurvedPainter extends CustomPainter {
  final Color color;
  final double curveHeight;

  TopCurvedPainter({required this.color, required this.curveHeight});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;

    Path path = Path();
    path.moveTo(0, curveHeight);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      curveHeight,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}