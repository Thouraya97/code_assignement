import 'package:code_assignement/Model/categoryModel.dart';
import 'package:code_assignement/Model/tagModel.dart';

import '../Enums/Status.dart';

class Pet {
  int? petId;
  String? petName;
  List<String>? photoUrls;
  List<Category>? category;
  List<Tag>? tags;
  String? status;

  Pet(
      {this.petId,
      this.petName,
      this.photoUrls,
      this.category,
      this.tags,
      this.status});

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      petId: json['id'] == null ? null : json["id"],
      petName: json['name'] == null ? null : json["name"],
      photoUrls: json['photoUrls'] == null
          ? null
          : List<String>.from(json['photoUrls'].map((x) => x)),
      category: json['category'] == 200
          ? (json['category'] as List).map((i) => Category.fromJson(i)).toList()
          : null,
      status: json['status'] == null ? null : json["status"],
    );
  }
}
