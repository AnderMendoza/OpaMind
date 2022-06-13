import 'dart:convert';

class PopReport {
    PopReport({
        required this.id,
        required this.count,
    });

    String id;
    int count;

    factory PopReport.fromJson(String str) => PopReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PopReport.fromMap(Map<String, dynamic> json) => PopReport(
        id: json["_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
    };
}
