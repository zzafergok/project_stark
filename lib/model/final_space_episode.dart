// To parse this JSON data, do
//
//     final finalSpaceEpisode = finalSpaceEpisodeFromJson(jsonString);

import 'dart:convert';

List<FinalSpaceEpisode> finalSpaceEpisodeFromJson(String str) => List<FinalSpaceEpisode>.from(json.decode(str).map((x) => FinalSpaceEpisode.fromJson(x)));

String finalSpaceEpisodeToJson(List<FinalSpaceEpisode> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FinalSpaceEpisode {
  FinalSpaceEpisode({
    this.id,
    this.name,
    this.airDate,
    this.director,
    this.writer,
    this.characters,
    this.imgUrl,
  });

  int id;
  String name;
  String airDate;
  String director;
  String writer;
  List<String> characters;
  String imgUrl;

  factory FinalSpaceEpisode.fromJson(Map<String, dynamic> json) => FinalSpaceEpisode(
    id: json["id"],
    name: json["name"],
    airDate: json["air_date"],
    director: json["director"],
    writer: json["writer"],
    characters: List<String>.from(json["characters"].map((x) => x)),
    imgUrl: json["img_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "air_date": airDate,
    "director": director,
    "writer": writer,
    "characters": List<dynamic>.from(characters.map((x) => x)),
    "img_url": imgUrl,
  };
}
