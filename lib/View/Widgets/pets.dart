import 'dart:convert';

import 'package:code_assignement/Controller/NetworkHandler.dart';
import 'package:code_assignement/View/Widgets/petTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

import '../../Model/petModel.dart';

class Pets extends StatefulWidget {
  Pets({Key? key, this.url, this.margin, this.title}) : super(key: key);
  final String? url;
  final EdgeInsets? margin;
  final String? title;

  @override
  _PetsState createState() => _PetsState();
}

class _PetsState extends State<Pets> {
  NetworkHandler networkHandler = NetworkHandler();
  List<Pet> petList = <Pet>[];

  List<dynamic> listp = [];

  Pet petsl = Pet();

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPets();
  }

  void getPets() async {
    Map<String, String> queryParams = {
      'status': widget.title!,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = widget.url! + '?' + queryString;

    networkHandler.getdata(requestUrl).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        print(response.body);
        petList = list.map((model) => Pet.fromJson(model)).toList();
        print(petList.length);
        print(petList[0].status);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: petList.length,
        itemBuilder: (BuildContext ctx, index) {
          return pTile(
            id: petList[index].petId.toString(),
            name: petList[index].petName,
            //assetName: petList[index].photoUrls![0].toString(),
          );
        });
  }
}
