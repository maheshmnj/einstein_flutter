import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'E=MC2',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        body: LayoutBuilder(builder: (context, constraints) {
          return Center(
              child: Stack(alignment: Alignment.center, children: [
            BlackBoardPainter(),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: CustomPaint(painter: BodyPainter())),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: CustomPaint(painter: HairPainter())),
          ]));
        }));
  }
}

class BlackBoardPainter extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: size.width,
      height: size.width / 2,
      color: Colors.white.withOpacity(0.6),
      child: Container(
        color: Colors.green[900],
        alignment: Alignment.center,
        child: Text(
          'Theory of Relativity',
          style: TextStyle(shadows: [
            Shadow(blurRadius: 2, color: Colors.grey, offset: Offset(0, 1))
          ], color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

class BodyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;
    final path = new Path();
    final center = size.center(Offset.zero);
    final c = Offset(center.dx - 60, center.dy);
    final double width = 60;
    double height = 100;

    final currentPoint = Offset(c.dx - width, center.dy + 2 * height);
    path.moveTo(currentPoint.dx, currentPoint.dy);
    path.lineTo(currentPoint.dx, center.dy + height + 10);
    canvas.drawArc(
        new Rect.fromCenter(
            center: Offset(c.dx, c.dy + height + 10), height: 120, width: 120),
        math.pi,
        math.pi,
        true,
        paint);
    path.lineTo(currentPoint.dx + 120, center.dy + height + 10);
    path.lineTo(currentPoint.dx + 120, currentPoint.dy);
    canvas.drawPath(path, paint);
    Paint handPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;
    final path2 = new Path();
    path2.moveTo(currentPoint.dx + 110, currentPoint.dy - 20);
    path2.lineTo(currentPoint.dx + 175, center.dy + height - 20);
    path2.lineTo(currentPoint.dx + 155, center.dy + height - 35);
    path2.lineTo(currentPoint.dx + 110, currentPoint.dy - 70);
    canvas.drawPath(path2, handPaint);
    Paint wristPaint = Paint()
      ..color = Colors.brown[50]
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;
    final path3 = new Path();
    path3.moveTo(currentPoint.dx + 172, center.dy + height - 20);
    final wristPoint = Offset(currentPoint.dx + 172, center.dy + height - 20);
    path3.lineTo(wristPoint.dx + 8, wristPoint.dy - 12);
    path3.quadraticBezierTo(wristPoint.dx + 10, wristPoint.dy - 15,
        wristPoint.dx - 5, wristPoint.dy - 25);
    path.lineTo(wristPoint.dx - 3, wristPoint.dy - 30);
    path3.quadraticBezierTo(wristPoint.dx + 10, wristPoint.dy - 15,
        wristPoint.dx - 5, wristPoint.dy - 25);
    path.lineTo(wristPoint.dx + 12, wristPoint.dy - 45);
    path3.quadraticBezierTo(wristPoint.dx + 8, wristPoint.dy - 15,
        wristPoint.dx - 5, wristPoint.dy - 25);
    // );

    canvas.drawPath(path3, wristPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HairPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint hairPaint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;
    final path = new Path();
    final center = Offset.zero;

    final hairCenter = Offset(center.dx - 60, center.dy + 20);
    // path.addOval(Rect.fromCenter(center: hairCenter, width: 20, height: 20));
    // canvas.drawArc(
    //     new Rect.fromCenter(
    //         center: Offset(hairCenter.dx - 20, hairCenter.dy - 20),
    //         height: 40,
    //         width: 40),
    //     math.pi,
    //     math.pi,
    //     true,
    //     hairPaint);
    drawArc(Offset(hairCenter.dx - 20, hairCenter.dy - 10), canvas, hairPaint);
    drawArc(Offset(hairCenter.dx - 10, hairCenter.dy - 10), canvas, hairPaint);
    drawArc(Offset(hairCenter.dx, hairCenter.dy - 20), canvas, hairPaint);
    // path2.moveTo(currentPoint.dx + 120, currentPoint.dy);
    // path2.lineTo(currentPoint.dx + 200, center.dy + height - 20);
    // path2.lineTo(currentPoint.dx + 150, center.dy);

    canvas.drawPath(path, hairPaint);
  }

  void drawArc(Offset center, Canvas canvas, Paint paint) {
    canvas.drawArc(
        new Rect.fromCenter(
            center: Offset(center.dx - 20, center.dy - 20),
            height: 40,
            width: 40),
        math.pi,
        math.pi,
        true,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
