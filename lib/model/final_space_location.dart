// To parse this JSON data, do
//
//     final finalSpaceLocation = finalSpaceLocationFromJson(jsonString);

import 'dart:convert';

List<FinalSpaceLocation> finalSpaceLocationFromJson(String str) => List<FinalSpaceLocation>.from(json.decode(str).map((x) => FinalSpaceLocation.fromJson(x)));

String finalSpaceLocationToJson(List<FinalSpaceLocation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FinalSpaceLocation {
  FinalSpaceLocation({
    this.id,
    this.name,
    this.type,
    this.inhabitants,
    this.notableResidents,
    this.imgUrl,
  });

  int id;
  String name;
  String type;
  List<String> inhabitants;
  List<String> notableResidents;
  String imgUrl;

  factory FinalSpaceLocation.fromJson(Map<String, dynamic> json) => FinalSpaceLocation(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    inhabitants: List<String>.from(json["inhabitants"].map((x) => x)),
    notableResidents: List<String>.from(json["notable_residents"].map((x) => x)),
    imgUrl: json["img_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "inhabitants": List<dynamic>.from(inhabitants.map((x) => x)),
    "notable_residents": List<dynamic>.from(notableResidents.map((x) => x)),
    "img_url": imgUrl,
  };
}
