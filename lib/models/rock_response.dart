import 'dart:convert';

import 'package:OpaMind/models/rock.dart';

class RockResponse {
    RockResponse({
        required this.rocks,
    });

    List<Rock> rocks;

    factory RockResponse.fromJson(String str) => RockResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RockResponse.fromMap(Map<String, dynamic> json) => RockResponse(
        rocks: List<Rock>.from(json["rocks"].map((x) => Rock.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "rocks": List<dynamic>.from(rocks.map((x) => x.toMap())),
    };
}