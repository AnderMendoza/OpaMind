import 'dart:convert';

class JazzReport {
    JazzReport({
        required this.id,
        required this.count,
    });

    String id;
    int count;

    factory JazzReport.fromJson(String str) => JazzReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory JazzReport.fromMap(Map<String, dynamic> json) => JazzReport(
        id: json["_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
    };
}