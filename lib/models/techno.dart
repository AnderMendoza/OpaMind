import 'dart:convert';

class Techno {
  Techno({
    required this.id,
    required this.technoId,
    required this.portada,
    required this.cancion,
    required this.banda,
    required this.url,
  });

  String id;
  int technoId;
  String portada;
  String cancion;
  String banda;
  String url;

  factory Techno.fromJson(String str) => Techno.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Techno.fromMap(Map<String, dynamic> json) => Techno(
      id: json["_id"],
      technoId: json["technoId"],
      portada: json["portada"],
      cancion: json["cancion"],
      banda: json["banda"],
      url: json["url"]);

  Map<String, dynamic> toMap() => {
        "_id": id,
        "technoId": technoId,
        "portada": portada,
        "cancion": cancion,
        "banda": banda,
        "url": url,
      };
}
