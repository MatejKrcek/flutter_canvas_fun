import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomPaintRoute(),
    );
  }
}

class CustomPaintRoute extends StatelessWidget {
  const CustomPaintRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: CustomPaint(
        size: Size(width, height),
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 25;

    //!Grid background
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    canvas.drawRect(Offset.zero & size, paint);

    //!Grid style
    paint
      ..style = PaintingStyle.stroke //line
      ..color = const Color(0xffe1e9f0)
      ..strokeWidth = 1;

    for (int i = 0; i <= 40; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 20; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //!triangle
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.amber
      ..strokeWidth = 5;

    final triangle = Path();
    triangle.moveTo(250, 450);
    triangle.relativeLineTo(-50, 50); //x,y
    triangle.relativeLineTo(50, 50);
    triangle.close();
    canvas.drawPath(triangle, paint);

    final triangle2 = Path();
    triangle2.moveTo(150, 450);
    triangle2.relativeLineTo(50, 50);
    triangle2.relativeLineTo(-50, 50);
    triangle2.close();
    canvas.drawPath(triangle2, paint);

    //!square
    final square1 = Path();
    square1.moveTo(200, 250);
    square1.relativeLineTo(100, 100);
    square1.relativeLineTo(-100, 100);
    square1.relativeLineTo(-100, -100);
    square1.close();
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.green
      ..strokeWidth = 5;
    canvas.drawPath(square1, paint);

    //!circle
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 5;
    const double circleRadius = 50.0;
    const Offset circleCenter = Offset(200, 150);
    canvas.drawCircle(circleCenter, circleRadius, paint);

    //!curve
    final qCurve1 = Path()
      ..moveTo(50, 300)
      ..relativeQuadraticBezierTo(100, -150, 300, 0);
    canvas.drawPath(qCurve1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
