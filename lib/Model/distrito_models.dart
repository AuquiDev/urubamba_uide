// To parse this JSON data, do
//
//     final distritoResponsive = distritoResponsiveFromMap(jsonString);

import 'dart:convert';

class DistritoResponsive {
    DistritoResponsive({
        required this.distritos,
    });

    List<Distrito> distritos;

    factory DistritoResponsive.fromJson(String str) => DistritoResponsive.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DistritoResponsive.fromMap(Map<String, dynamic> json) => DistritoResponsive(
        distritos: List<Distrito>.from(json["distritos"].map((x) => Distrito.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "distritos": List<dynamic>.from(distritos.map((x) => x.toMap())),
    };
}

class Distrito {
    Distrito({
       required  this.title,
       required  this.descripcion,
       required  this.imagen,
       required  this.id,
    });

    String title;
    String descripcion;
    String imagen;
    int id;

    factory Distrito.fromJson(String str) => Distrito.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Distrito.fromMap(Map<String, dynamic> json) => Distrito(
        title: json["title"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "descripcion": descripcion,
        "imagen": imagen,
        "id": id,
    };
}
