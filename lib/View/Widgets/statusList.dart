import 'dart:math';

import 'package:code_assignement/View/Widgets/statusTile.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class sList extends StatefulWidget {
  @override
  _sListState createState() => _sListState();
}

class _sListState extends State<sList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          sTile(
            assetPath: 'assets/available.png',
            title: 'available',
          ),
          sTile(
            assetPath: 'assets/pending.png',
            title: 'pending',
          ),
          sTile(
            assetPath: 'assets/sold.png',
            title: 'sold',
          ),
        ],
      ),
    );
  }
}
