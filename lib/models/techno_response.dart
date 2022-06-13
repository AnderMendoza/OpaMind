import 'dart:convert';

import 'package:OpaMind/models/techno.dart';

class TechnoResponse {
    TechnoResponse({
        required this.technos,
    });

    List<Techno> technos;

    factory TechnoResponse.fromJson(String str) => TechnoResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TechnoResponse.fromMap(Map<String, dynamic> json) => TechnoResponse(
        technos: List<Techno>.from(json["Technos"].map((x) => Techno.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "Technos": List<dynamic>.from(technos.map((x) => x.toMap())),
    };
}