import 'dart:ui';

import 'package:flutter/material.dart';

class TimelineStartWidget extends StatelessWidget {
  const TimelineStartWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      child: Stack(children: [
        Positioned(
          left: 100,
          top: 60,
          child: CustomPaint(
            painter: _StartPointPainter(),
          ),
        ),
        Positioned(
          top: 25,
          child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pinkAccent,width: 2)
                ),
                  alignment: Alignment.center,
                  child: Center(
                      child: Text(
                    'Unknown events',
                    textAlign: TextAlign.center,
                  )))),
        )
      ]),
    );
  }
}

class _StartPointPainter extends CustomPainter {
  double tickness;
  double maxLineLength;
  final double _spacing = 5;
  Offset _startP, _endP;
  Color color;
  Paint brush;

  _StartPointPainter(
      {this.tickness = 2,
      this.maxLineLength = 200,
      // this.startP = const Offset(-100, 0),
      // this.endP = const Offset(100, 0),
      color = Colors.pinkAccent}) {
    _startP = Offset(-maxLineLength / 2, 0);
    _endP = Offset(maxLineLength / 2, 0);

    brush = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(_startP, _endP, brush);
    canvas.drawLine(Offset(_startP.dx / 2, _startP.dy + _spacing),
        Offset(_endP.dx / 2, _endP.dy + _spacing), brush);
    canvas.drawLine(Offset(_startP.dx / 4, _startP.dy + _spacing * 2),
        Offset(_endP.dx / 4, _endP.dy + _spacing * 2), brush);
    canvas.drawCircle(Offset(0, (_spacing * 3.5)), 5, brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
