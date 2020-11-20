// To parse this JSON data, do
//
//     final rickandMortyLocation = rickandMortyLocationFromJson(jsonString);

import 'dart:convert';

RickandMortyLocation rickandMortyLocationFromJson(String str) => RickandMortyLocation.fromJson(json.decode(str));

String rickandMortyLocationToJson(RickandMortyLocation data) => json.encode(data.toJson());

class RickandMortyLocation {
  RickandMortyLocation({
    this.info,
    this.results,
  });

  Info info;
  List<Result> results;

  factory RickandMortyLocation.fromJson(Map<String, dynamic> json) => RickandMortyLocation(
    info: Info.fromJson(json["info"]),
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Info {
  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  int count;
  int pages;
  String next;
  dynamic prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  DateTime created;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    dimension: json["dimension"],
    residents: List<String>.from(json["residents"].map((x) => x)),
    url: json["url"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "dimension": dimension,
    "residents": List<dynamic>.from(residents.map((x) => x)),
    "url": url,
    "created": created.toIso8601String(),
  };
}
