import 'package:code_assignement/View/Pages/petStatus.dart';
import 'package:flutter/material.dart';

class pTile extends StatelessWidget {
  const pTile({
    Key? key,
    this.name,
    this.id,
  }) : super(key: key);
  final String? name;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 80,
          width: 80,
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
            color: Color(0xffe2f2c4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/pet.jpg",
                  height: 50,
                  width: 50,
                ),
                Text(name!),
                Text(id!)
              ],
            ),
          )),
    );
  }
}
