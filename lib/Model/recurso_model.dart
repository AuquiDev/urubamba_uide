// To parse this JSON data, do
//
//     final recursoResponsive = recursoResponsiveFromMap(jsonString);

import 'dart:convert';

class RecursoResponsive {
    RecursoResponsive({
       required  this.recursos,
    });

    List<Recurso> recursos;

    factory RecursoResponsive.fromJson(String str) => RecursoResponsive.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RecursoResponsive.fromMap(Map<String, dynamic> json) => RecursoResponsive(
        recursos: List<Recurso>.from(json["recursos"].map((x) => Recurso.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "recursos": List<dynamic>.from(recursos.map((x) => x.toMap())),
    };
}

class Recurso {
    Recurso({
      required  this.name,
      required   this.image,
      required   this.descripcion,
      required   this.id,
    });

    String name;
    String image;
    String descripcion;
    int id;

    factory Recurso.fromJson(String str) => Recurso.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Recurso.fromMap(Map<String, dynamic> json) => Recurso(
        name: json["name"],
        image: json["image"],
        descripcion: json["descripcion"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
        "descripcion": descripcion,
        "id": id,
    };
}
