import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OverlayCard extends StatelessWidget {
  const OverlayCard({Key? key, this.imagefile, this.title}) : super(key: key);
  final PickedFile? imagefile;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff7be495),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      height: 200,
      width: 160,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 70,
                  padding: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(
                        File(imagefile!.path),
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Text(
                  title!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
