// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  Posts({
    this.postId,
    this.id,
    this.name,
  });

  int? postId;
  int? id;
  String? name;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
  };
}
