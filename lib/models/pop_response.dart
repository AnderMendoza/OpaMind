import 'dart:convert';

import 'package:OpaMind/models/pop.dart';

class PopResponse {
    PopResponse({
        required this.pops,
    });

    List<Pop> pops;

    factory PopResponse.fromJson(String str) => PopResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PopResponse.fromMap(Map<String, dynamic> json) => PopResponse(
        pops: List<Pop>.from(json["pops"].map((x) => Pop.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "pops": List<dynamic>.from(pops.map((x) => x.toMap())),
    };
}