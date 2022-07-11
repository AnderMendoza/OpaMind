import 'dart:convert';

class Techno {
  Techno({
    required this.id,
    required this.technosId,
    required this.portada,
    required this.cancion,
    required this.banda,
    required this.url,
  });

  String id;
  int technosId;
  String portada;
  String cancion;
  String banda;
  String url;

  factory Techno.fromJson(String str) => Techno.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Techno.fromMap(Map<String, dynamic> json) => Techno(
      id: json["_id"],
      technosId: json["technosId"],
      portada: json["portada"],
      cancion: json["cancion"],
      banda: json["banda"],
      url: json["url"]);

  Map<String, dynamic> toMap() => {
        "_id": id,
        "technosId": technosId,
        "portada": portada,
        "cancion": cancion,
        "banda": banda,
        "url": url,
      };
}
