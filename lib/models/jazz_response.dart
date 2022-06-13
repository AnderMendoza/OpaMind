import 'dart:convert';

import 'package:OpaMind/models/jazz.dart';

class JazzResponse {
    JazzResponse({
        required this.jazzs,
    });

    List<Jazz> jazzs;

    factory JazzResponse.fromJson(String str) => JazzResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory JazzResponse.fromMap(Map<String, dynamic> json) => JazzResponse(
        jazzs: List<Jazz>.from(json["Jazzs"].map((x) => Jazz.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "Jazzs": List<dynamic>.from(jazzs.map((x) => x.toMap())),
    };
}
