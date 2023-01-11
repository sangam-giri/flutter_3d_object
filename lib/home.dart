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
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(_offset.dy * pi / 180)
        ..rotateY(_offset.dx * pi / 180),
      child: GestureDetector(
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
        ),
      ),
    );
  }
}
