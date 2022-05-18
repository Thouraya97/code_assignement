import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "https://petstore.swagger.io/v2";
  var log = Logger();

  Future<void> remove(String url) async {
    url = formater(url);
    // log.d(_id);
    var response = await http.delete(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        //    "Authorization": "Bearer $token"
      },
    );
    //return response;
  }

  Future<http.Response> post1(String url, var body) async {
    url = formater(url);
    log.d(body);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        //"Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future getdata(String url) {
    url = formater(url);
    return http.get(Uri.parse(url), headers: {
      "Content-type": "application/json",
      'Accept': 'application/json'
    });
  }

  String formater(String url) {
    return baseurl + url;
  }

  Future<http.Response> patchImage(String url, String filePath) async {
    //String token = await storage.read(key: "token");
    url = formater(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        //   "Authorization": "Bearer $token"
      },
      body: filePath,
    );
    return response;
  }

  Future<http.Response> patch1(String url) async {
    //String token = await storage.read(key: "token");
    url = formater(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        //   "Authorization": "Bearer $token"
      },
    );
    return response;
  }
}
