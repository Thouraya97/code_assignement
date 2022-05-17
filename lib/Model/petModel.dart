import 'package:code_assignement/Model/categoryModel.dart';
import 'package:code_assignement/Model/tagModel.dart';

import '../Enums/Status.dart';

class Pet {
  int? petId;
  String? petName;
  List<String>? photoUrls;
  List<Category>? category;
  List<Tag>? tags;
  Status? status;

  Pet(
      {this.petId,
      this.petName,
      this.photoUrls,
      this.category,
      this.tags,
      this.status});

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        petId: json['id'] == null ? null : json["id"],
        petName: json['name'] == null ? null : json["name"],
        photoUrls: json['photoUrls'] == null
            ? null
            : List<String>.from(json['photoUrls'].map((x) => x)),
        category: json['category'] == null
            ? null
            : List<Category>.from(json['category'].map((x) => x)),
        tags: json['tags'] == null
            ? null
            : List<Tag>.from(json['tags'].map((x) => x)),
        status: json['status'] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": petId,
        "name": petName,
        "photoUrls": photoUrls,
        "category": category == null
            ? null
            : List<dynamic>.from(category!.map((e) => e)),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((e) => e)),
        "status": status,
      };
}
