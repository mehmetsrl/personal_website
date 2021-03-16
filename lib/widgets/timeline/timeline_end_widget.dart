import 'package:flutter/material.dart';
import 'package:personal_website/constants/text_styles.dart';

class TimelineEndWidget extends StatelessWidget {
  const TimelineEndWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 50,
      child: Stack(children: [
        Positioned(
          left: 25,
          top: 35,
          child: CustomPaint(
            painter: _EndPointPainter(radious: 40,color: Colors.orangeAccent),
          ),
        ),
        Positioned(
          child: Align(
              alignment: Alignment.center,
              child: Container(
                  alignment: Alignment.center,
                  child: Center(
                      child: Text(
                    'You are here!',style: getTextStyle(TextTypes.cardTitle),
                    textAlign: TextAlign.center,
                  )))),
        ),
      ]),
    );
  }
}

class _EndPointPainter extends CustomPainter {
  double radious;
  Offset offset;
  Color color;
  Paint brush, borderBrush;
  _EndPointPainter(
      {this.radious = 100,
      this.offset = const Offset(0, 0),
      color = Colors.pinkAccent}) {
    brush = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    borderBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //a circle
    canvas.drawCircle(offset, radious, brush);
    canvas.drawCircle(offset, radious, borderBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
