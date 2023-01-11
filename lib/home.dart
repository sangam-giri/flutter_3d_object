import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: ((details) {
        print(details);
        setState(() {
          _offset += details.delta;
        });
      }),
      child: Scaffold(
          appBar: AppBar(
            title: Text('This is a Flutter App'),
          ),
          body: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_offset.dy * pi / 180)
              ..rotateY(_offset.dx * pi / 180),
            alignment: Alignment.center,
            child: Center(child: Cube()),
          )),
    );
  }
}

class Cube extends StatelessWidget {
  const Cube({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()..translate(100.0, 0.0, 0.0),
          child: Container(
            color: Colors.red,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(100.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          child: Container(
            color: Colors.orange,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(100.0, 0.0, 0.0)
            ..rotateX(pi / 2),
          child: Container(
            color: Colors.blue,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(100.0, 200.0, 0.0)
            ..rotateX(pi / 2),
          child: Container(
            color: Colors.yellow,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(100.0, 0.0, 200.0)
            ..rotateX(pi / 30),
          child: Container(
            color: Colors.yellow,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(300.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          child: Container(
            color: Colors.green,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
      ],
    );
  }
}
