class Category {
  int? categoryId;
  String? name;

  Category({this.categoryId, this.name});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      categoryId: json['id'] == null ? null : json["id"],
      name: json['name'] == null ? null : json["id"]);

  Map<String, dynamic> toJson() => {
        "id": categoryId,
        "name": name,
      };
}
