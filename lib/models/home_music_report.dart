import 'dart:convert';

class HmusicReport {
  HmusicReport({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory HmusicReport.fromJson(String str) =>
      HmusicReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HmusicReport.fromMap(Map<String, dynamic> json) => HmusicReport(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
