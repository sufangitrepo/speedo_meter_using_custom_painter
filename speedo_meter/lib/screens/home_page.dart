
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedo_meter/painter/speedo_meter_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Container(
        height: 500,
        width: 500,
        //color: Colors.red,
        child:CustomPaint(
          painter: SpeedoMeter(),
        ),)),
    );
  }
}


