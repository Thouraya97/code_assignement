class Tag {
  int? tagId;
  String? tagName;

  Tag({this.tagId, this.tagName});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
      tagId: json['id'] == null ? null : json["id"],
      tagName: json['name'] == null ? null : json["id"]);

  Map<String, dynamic> toJson() => {
        "id": tagId,
        "name": tagName,
      };
}
