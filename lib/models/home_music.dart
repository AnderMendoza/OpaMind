import 'dart:convert';

class Hmusic {
  Hmusic({
    required this.id,
    required this.hmusicId,
    required this.title,
    required this.singer,
    required this.url,
    required this.coverUrl,
  });

  String id;
  int hmusicId;
  String title;
  String singer;
  String url;
  String coverUrl;

  factory Hmusic.fromJson(String str) => Hmusic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hmusic.fromMap(Map<String, dynamic> json) => Hmusic(
        id: json["_id"],
        hmusicId: json["hmusicId"],
        title: json["title"],
        singer: json["singer"],
        url: json["url"],
        coverUrl: json["coverUrl"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "hmusicId": hmusicId,
        "title": title,
        "singer": singer,
        "url": url,
        "coverUrl": coverUrl,
      };
}
