// To parse this JSON data, do
//
//     final imdb = imdbFromJson(jsonString);

import 'dart:convert';

Imdb imdbFromJson(String str) => Imdb.fromJson(json.decode(str));

String imdbToJson(Imdb data) => json.encode(data.toJson());

class Imdb {
  Imdb({
    this.d,
    this.q,
    this.v,
  });

  List<D>? d;
  String? q;
  int? v;

  factory Imdb.fromJson(Map<String, dynamic> json) => Imdb(
    d: json["d"] == null ? [] : List<D>.from(json["d"]!.map((x) => D.fromJson(x))),
    q: json["q"],
    v: json["v"],
  );

  Map<String, dynamic> toJson() => {
    "d": d == null ? [] : List<dynamic>.from(d!.map((x) => x.toJson())),
    "q": q,
    "v": v,
  };
}

class D {
  D({
    this.i,
    this.id,
    this.l,
    this.q,
    this.qid,
    this.rank,
    this.s,
    this.y,
    this.yr,
  });

  I? i;
  String? id;
  String? l;
  String? q;
  String? qid;
  int? rank;
  String? s;
  int? y;
  String? yr;

  factory D.fromJson(Map<String, dynamic> json) => D(
    i: json["i"] == null ? null : I.fromJson(json["i"]),
    id: json["id"],
    l: json["l"],
    q: json["q"],
    qid: json["qid"],
    rank: json["rank"],
    s: json["s"],
    y: json["y"],
    yr: json["yr"],
  );

  Map<String, dynamic> toJson() => {
    "i": i?.toJson(),
    "id": id,
    "l": l,
    "q": q,
    "qid": qid,
    "rank": rank,
    "s": s,
    "y": y,
    "yr": yr,
  };
}

class I {
  I({
    this.height,
    this.imageUrl,
    this.width,
  });

  int? height;
  String? imageUrl;
  int? width;

  factory I.fromJson(Map<String, dynamic> json) => I(
    height: json["height"],
    imageUrl: json["imageUrl"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "imageUrl": imageUrl,
    "width": width,
  };
}
