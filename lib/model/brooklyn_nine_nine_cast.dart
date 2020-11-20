// To parse this JSON data, do
//
//     final brooklynNineNineCast = brooklynNineNineCastFromJson(jsonString);

import 'dart:convert';

List<BrooklynNineNineCast> brooklynNineNineCastFromJson(String str) => List<BrooklynNineNineCast>.from(json.decode(str).map((x) => BrooklynNineNineCast.fromJson(x)));

String brooklynNineNineCastToJson(List<BrooklynNineNineCast> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrooklynNineNineCast {
  BrooklynNineNineCast({
    this.person,
    this.character,
    this.self,
    this.voice,
  });

  Person person;
  Character character;
  bool self;
  bool voice;

  factory BrooklynNineNineCast.fromJson(Map<String, dynamic> json) => BrooklynNineNineCast(
    person: Person.fromJson(json["person"]),
    character: Character.fromJson(json["character"]),
    self: json["self"],
    voice: json["voice"],
  );

  Map<String, dynamic> toJson() => {
    "person": person.toJson(),
    "character": character.toJson(),
    "self": self,
    "voice": voice,
  };
}

class Character {
  Character({
    this.id,
    this.url,
    this.name,
    this.image,
    this.links,
  });

  int id;
  String url;
  String name;
  Image image;
  Links links;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    image: Image.fromJson(json["image"]),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "image": image.toJson(),
    "_links": links.toJson(),
  };
}

class Image {
  Image({
    this.medium,
    this.original,
  });

  String medium;
  String original;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    medium: json["medium"],
    original: json["original"],
  );

  Map<String, dynamic> toJson() => {
    "medium": medium,
    "original": original,
  };
}

class Links {
  Links({
    this.self,
  });

  Self self;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: Self.fromJson(json["self"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self.toJson(),
  };
}

class Self {
  Self({
    this.href,
  });

  String href;

  factory Self.fromJson(Map<String, dynamic> json) => Self(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Person {
  Person({
    this.id,
    this.url,
    this.name,
    this.country,
    this.birthday,
    this.deathday,
    this.gender,
    this.image,
    this.links,
  });

  int id;
  String url;
  String name;
  Country country;
  DateTime birthday;
  dynamic deathday;
  String gender;
  Image image;
  Links links;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    country: Country.fromJson(json["country"]),
    birthday: DateTime.parse(json["birthday"]),
    deathday: json["deathday"],
    gender: json["gender"],
    image: Image.fromJson(json["image"]),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "country": country.toJson(),
    "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "deathday": deathday,
    "gender": gender,
    "image": image.toJson(),
    "_links": links.toJson(),
  };
}

class Country {
  Country({
    this.name,
    this.code,
    this.timezone,
  });

  String name;
  String code;
  String timezone;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["name"],
    code: json["code"],
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "timezone": timezone,
  };
}
