// To parse this JSON data, do
//
//     final finalSpaceCharacter = finalSpaceCharacterFromJson(jsonString);

import 'dart:convert';

List<FinalSpaceCharacter> finalSpaceCharacterFromJson(String str) => List<FinalSpaceCharacter>.from(json.decode(str).map((x) => FinalSpaceCharacter.fromJson(x)));

String finalSpaceCharacterToJson(List<FinalSpaceCharacter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FinalSpaceCharacter {
  FinalSpaceCharacter({
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.hair,
    this.alias,
    this.origin,
    this.abilities,
    this.imgUrl,
  });

  int id;
  String name;
  String status;
  String species;
  String gender;
  String hair;
  List<String> alias;
  String origin;
  List<String> abilities;
  String imgUrl;

  factory FinalSpaceCharacter.fromJson(Map<String, dynamic> json) => FinalSpaceCharacter(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    species: json["species"] == null ? null : json["species"],
    gender: json["gender"],
    hair: json["hair"],
    alias: List<String>.from(json["alias"].map((x) => x)),
    origin: json["origin"],
    abilities: List<String>.from(json["abilities"].map((x) => x)),
    imgUrl: json["img_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "species": species == null ? null : species,
    "gender": gender,
    "hair": hair,
    "alias": List<dynamic>.from(alias.map((x) => x)),
    "origin": origin,
    "abilities": List<dynamic>.from(abilities.map((x) => x)),
    "img_url": imgUrl,
  };
}
