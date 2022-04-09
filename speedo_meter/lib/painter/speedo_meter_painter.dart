import 'dart:math';


import 'package:flutter/material.dart';

class SpeedoMeter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height;
    final double width = size.width;
    final double radius = min(width, height) / 2;

    final double arcMargin = radius * .02;
    final Offset centerPosition = Offset((width / 2), (height / 2));
    final double needleBaseRadius = radius * .05;
    final double needleBaseMargin = radius * .15;
    final double needleLength = radius * .3;
    final double needleMargin = radius * .05;

    final double tickLength = radius * .04;



    /***
         *
         * Outer Arc
         *
         */

    Paint paintForOuterArc = Paint()..color = Colors.red;
    canvas.drawArc(Rect.fromCircle(center: centerPosition, radius: radius), pi,
        pi, true, paintForOuterArc);

    /****
     *
     *
     *
     * Half Circle of Speedo Meter
     *
     *
     */

    final Paint paintForSpeedoCircle = Paint()..color = Colors.black;
    canvas.drawArc(
        Rect.fromCircle(center: centerPosition, radius: radius - arcMargin),
        pi,
        pi,
        true,
        paintForSpeedoCircle);


    /**
     *
     * Text  in middle
     *
     */

    TextSpan spanTitle  = TextSpan(text: 'Speedo Meter',style: TextStyle(color: Colors.white38, fontSize: radius*.1,fontStyle: FontStyle.italic));
    TextPainter textPainterForTitle = TextPainter(
    text: spanTitle,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left
    );
    textPainterForTitle.layout();
    textPainterForTitle.paint(canvas, Offset(radius-radius*.3, radius/2));







    /****
     *
     * Needle base radius
     *
     */
    final Paint needleBasePaint = Paint()..color = Colors.white;
    canvas.drawCircle(
        Offset(centerPosition.dx, centerPosition.dy - needleBaseMargin),
        needleBaseRadius,
        needleBasePaint);

    /***
     *
     * Needle of speedo meter
     *
     */

    final Paint needlePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4;
    canvas.drawLine(Offset(centerPosition.dx, centerPosition.dy - needleMargin),
        Offset(centerPosition.dx + needleMargin, needleLength), needlePaint);
    final Paint needleBasePaintUpper = Paint()..color = Colors.red;
    canvas.drawCircle(
        Offset(centerPosition.dx, centerPosition.dy - needleBaseMargin),
        needleBaseRadius,
        needleBasePaintUpper);

    canvas.save();
    canvas.translate(radius, 0);

    /****
     *
     * ////////////
     *
     * Ticks in Speedo meter
     *
     *
     */


    final double tickMargin = radius*.045;
    final double textMargin0 = radius*.04;
    final double textMargin120 = radius*.15;

    final double middleTick = radius*.04;

    Paint paintForTick = Paint()
      ..color = Colors.red
      ..strokeWidth = 3..strokeCap=StrokeCap.round;

    /***
     * first Center  line  tick
     */
    canvas.drawLine(Offset.zero, Offset(0, tickLength), paintForTick);
    TextSpan  spanFor60 = TextSpan(text: '60',style: TextStyle(color: Colors.blue,fontSize: radius*.07));
    TextPainter painterFor60 = TextPainter(text: spanFor60,textAlign: TextAlign.center,textDirection: TextDirection.ltr);
    painterFor60.layout();
    painterFor60.paint(canvas, Offset(-middleTick, tickLength+middleTick));
    canvas.restore();
    /***
     * seccond left  line  tick
     */
    canvas.drawLine(Offset(0, centerPosition.dy - tickMargin), Offset(tickLength, centerPosition.dy - tickMargin), paintForTick);

    //Text for speed show
    TextSpan textSpan = TextSpan(text: '0',style: TextStyle(color: Colors.blue, fontSize: radius*.07));
    TextPainter painter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    );
    painter.layout();
    painter.paint(canvas, Offset(tickLength+textMargin0 , centerPosition.dy - tickMargin-textMargin0));
    canvas.save();
    canvas.translate(radius + radius, radius);

    /***
     * Third right  line  tick
     */

    canvas.drawLine(Offset(0, -tickMargin), Offset(-tickMargin, -tickMargin), paintForTick);

    //Speed show data 120
    TextSpan span =  TextSpan(
        text: '120',
        style: TextStyle(color: Colors.blue,fontSize : radius *.07),
    );

    TextPainter painter120 = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
    );
    painter120.layout();

    painter120.paint(canvas,Offset(-tickMargin-textMargin120, -tickMargin-textMargin0) );
    canvas.restore();


    /**
     *
     * this is left second tick
     */

    canvas.drawLine(Offset(radius*.24, radius*.34), Offset(radius*.23+tickLength,radius*.36), Paint()..color=Colors.red..strokeWidth=3..strokeCap=StrokeCap.round);
    TextSpan spanFor30 = TextSpan(text: ' 30',style: TextStyle(color: Colors.blue,fontSize: radius*.07));
    TextPainter painterFor30 = TextPainter(
      text: spanFor30,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    );
    painterFor30.layout();
    painterFor30.paint(canvas,Offset(radius*.23+tickLength,radius*.38) );


    /***
     *
     * this is right second tick with text
     *
      */

    canvas.drawLine(Offset((2*radius)-radius*.245, radius*.34),Offset((2*radius)-radius*.23-tickLength,radius*.37 ),
        Paint()..color=Colors.red..strokeWidth=3..strokeCap=StrokeCap.round);
    TextSpan spanFor90 = TextSpan(text: '90',style: TextStyle(color: Colors.blue,fontSize: radius*.07));
    TextPainter painterFor90  = TextPainter(
      text: spanFor90 ,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    );
    painterFor90.layout();
    painterFor90.paint(canvas,Offset((2*radius)-radius*.33-tickLength,radius*.38 ),);
  }



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
