import 'dart:convert';
import 'package:OpaMind/models/home_music_report.dart';

class HmusicReportResponse {
  HmusicReportResponse({
    required this.hmusicReport,
  });

  List<HmusicReport> hmusicReport;

  factory HmusicReportResponse.fromJson(String str) =>
      HmusicReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HmusicReportResponse.fromMap(Map<String, dynamic> json) =>
      HmusicReportResponse(
        hmusicReport: List<HmusicReport>.from(
            json["HmusicReport"].map((x) => HmusicReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "HmusicReport": List<dynamic>.from(hmusicReport.map((x) => x.toMap())),
      };
}
