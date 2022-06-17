import 'dart:convert';

class RockReport {
    RockReport({
        required this.id,
        required this.count,
    });

    String id;
    int count;

    factory RockReport.fromJson(String str) => RockReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RockReport.fromMap(Map<String, dynamic> json) => RockReport(
        id: json["_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
    };
}