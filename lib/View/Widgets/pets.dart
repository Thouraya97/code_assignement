import 'dart:convert';

import 'package:code_assignement/Controller/NetworkHandler.dart';
import 'package:flutter/material.dart';
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
  List colors = [
    Color(0xffffdbc6),
    Color(0xffe2f2c4),
    Color(0xffdfecf7),
    Color(0xfff4dce0),
  ];
  String? titre;
  Random random = new Random();
  Color randomGenerator() {
    return colors[new Random().nextInt(1)];
  }

  int index = 0;

  void changeIndex() {
    setState(() => index = random.nextInt(3));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPets();
  }

  /*void fetchData() async {
    var response = await networkHandler.get(widget.url!);
  }*/
  String baseurl = "http://petstore.swagger.io/#/pet";
  Future getPets() async {
    Map<String, String> queryParams = {
      'status': widget.title!,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseurl + widget.url! + '?' + queryString; // result -

    var response = await networkHandler.getdata(requestUrl);
    print('Body: ${response.body}');
    print('Headers: ${response.headers}');

    print('Status code: ${response.statusCode}');

    //  print(response.body);
    /*var jsonResponse = json.decode(response);
    Pet pet = Pet.fromJson(jsonResponse);
    print(pet.petId);*/
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
