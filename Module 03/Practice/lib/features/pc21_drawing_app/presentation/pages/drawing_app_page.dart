import 'package:flutter/material.dart';

/// PC 21: Drawing app – white background, user draws with inbuilt paint (CustomPainter).
class DrawingAppPage extends StatefulWidget {
  const DrawingAppPage({super.key});

  @override
  State<DrawingAppPage> createState() => _DrawingAppPageState();
}

class _DrawingAppPageState extends State<DrawingAppPage> {
  List<Offset> _points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 21 – Drawing')),
      body: Container(
        color: Colors.white,
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() => _points = [..._points, details.localPosition]);
          },
          onPanEnd: (_) => setState(() => _points = [..._points, Offset.infinite]),
          child: CustomPaint(
            painter: _DrawingPainter(points: _points),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  _DrawingPainter({required this.points});
  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i + 1] != Offset.infinite && points[i] != Offset.infinite) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DrawingPainter old) => old.points != points;
}
