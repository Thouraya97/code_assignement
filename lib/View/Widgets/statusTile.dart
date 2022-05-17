import 'package:code_assignement/View/Pages/petStatus.dart';
import 'package:flutter/material.dart';

class sTile extends StatelessWidget {
  const sTile({Key? key, this.assetPath, this.title}) : super(key: key);
  final String? title;
  final String? assetPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
            height: 80,
            width: 120,
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
                    this.assetPath!,
                    height: 50,
                    width: 50,
                  ),
                  Text(this.title!)
                ],
              ),
            )),
        onTap: () {
          // print(this.title);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PetsStatus(title: this.title)));
        },
      ),
    );
  }
}
