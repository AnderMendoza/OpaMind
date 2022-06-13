import 'dart:convert';

import 'package:OpaMind/models/home_music.dart';

class HmusicResponse {
  HmusicResponse({
    required this.hmusics,
  });

  List<Hmusic> hmusics;

  factory HmusicResponse.fromJson(String str) =>
      HmusicResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HmusicResponse.fromMap(Map<String, dynamic> json) => HmusicResponse(
        hmusics:
            List<Hmusic>.from(json["hmusics"].map((x) => Hmusic.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "hmusics": List<dynamic>.from(hmusics.map((x) => x.toMap())),
      };
}
