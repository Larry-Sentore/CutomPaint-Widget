import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomPaint(
          painter: Sky(),
          child: Center(
            child: Text(
              'Once upon a time...',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Sky extends CustomPainter {
  const Sky();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final skyGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: const [
        Color(0xFF4FC3F7),
        Color(0xFF0288D1),
        Color(0xFF01579B),
      ],
      stops: const [0.0, 0.55, 1.0],
    );

    canvas.drawRect(
      rect,
      Paint()..shader = skyGradient.createShader(rect),
    );

    final sunPaint = Paint()
      ..color = const Color(0xFFFFF176)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.78, size.height * 0.22),
      size.width * 0.12,
      sunPaint,
    );

    // canvas.drawRect(
    //   Rect.fromLTWH(
    //     size.width * 0.0,
    //     size.height * 0.7,
    //     size.width,
    //     size.height * 0.3,
    //   ),
    //   Paint()..color = const Color(0xFF1B5E20),
    // );

    canvas.drawArc(
      Offset(size.width * 0.0, size.height * 0.7) & Size(size.width, size.height * 0.6),
      pi, // Start angle (in radians)
      pi, // Sweep angle (in radians)
      true, // Use center
      Paint()..color = const Color(0xFF1B5E20),
    );


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

