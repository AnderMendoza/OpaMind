import 'dart:convert';

class Pop {
    Pop({
        required this.id,
        required this.popId,
        required this.portada,
        required this.cancion,
        required this.banda,
    });

    String id;
    int popId;
    String portada;
    String cancion;
    String banda;

    factory Pop.fromJson(String str) => Pop.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pop.fromMap(Map<String, dynamic> json) => Pop(
        id: json["_id"],
        popId: json["popId"],
        portada: json["portada"],
        cancion: json["cancion"],
        banda: json["banda"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "popId": popId,
        "portada": portada,
        "cancion": cancion,
        "banda": banda,
    };
}