import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "http://petstore.swagger.io/#/pet";
  var log = Logger();

  Future<http.Response> post(String url, Map<String, String> body) async {
    url = formater(url);
    log.d(body);
    var response = await http.post(
      url,
      headers: {
        "Content-type": "application/json",
        //"Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<void> remove(String url) async {
    url = formater(url);
    // log.d(_id);
    var response = await http.delete(
      url,
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
      url,
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
    return http.get(url, headers: {
      "Content-type": "application/json",
      'Accept': 'application/json'
    });
  }

  Future<http.Response> patch(String url, Map<String, String> body) async {
    url = formater(url);
    log.d(body);
    var response = await http.patch(
      url,
      headers: {
        "Content-type": "application/json",
        // "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> postP(String url, var body) async {
    // String token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var response = await http.post(
      url,
      headers: {
        "Content-type": "application/json",
        //  "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.StreamedResponse> patchImage(String url, String filepath) async {
    url = formater(url);
    //String token = await storage.read(key: "token");
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath("img", filepath));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      // "Authorization": "Bearer $token"
    });
    var response = request.send();
    return response;
  }

  String formater(String url) {
    return baseurl + url;
  }

  NetworkImage getImage(String imageName) {
    String url = formater("/uploads//$imageName.jpg");
    return NetworkImage(url);
  }

  NetworkImage getImage2(String imageName) {
    String url = formater("/marchandises//$imageName.jpg");
    return NetworkImage(url);
  }

  Future<http.Response> patch1(String url) async {
    //String token = await storage.read(key: "token");
    url = formater(url);
    var response = await http.patch(
      url,
      headers: {
        "Content-type": "application/json",
        //   "Authorization": "Bearer $token"
      },
    );
    return response;
  }
}
