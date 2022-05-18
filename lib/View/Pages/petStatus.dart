import 'dart:math';

import 'package:code_assignement/Controller/NetworkHandler.dart';
import 'package:flutter/material.dart';

import '../Widgets/pets.dart';
import '../Widgets/pets.dart';

class PetsStatus extends StatefulWidget {
  final String? title;
  const PetsStatus({
    Key? key,
    @required this.title,
  }) : super(key: key);

  @override
  _PetsStatusState createState() => _PetsStatusState();
}

class _PetsStatusState extends State<PetsStatus> {
  int selectedOptionIndex = 0;
  NetworkHandler networkHandler = NetworkHandler();

  List colors = [
    Color(0xffffdbc6),
    Color(0xffe2f2c4),
    Color(0xffdfecf7),
    Color(0xfff4dce0),
    Color(0xffF4DEF8)
  ];
  Random random = new Random();
  Color randomGenerator() {
    return colors[new Random().nextInt(1)];
  }

  Widget profilePhoto = Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(50),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          color: Colors.grey,
          tooltip: 'Menu',
        ),
      ),
      body: Pets(
        margin: const EdgeInsets.only(top: 30.0),
        url: "/pet/findByStatus",
        title: widget.title,
      ),
    );
  }
}
