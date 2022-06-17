import 'dart:convert';
import 'package:OpaMind/models/jazz_report.dart';

class JazzReportResponse {
    JazzReportResponse({
        required this.jazzReport,
    });

    List<JazzReport> jazzReport;

    factory JazzReportResponse.fromJson(String str) => JazzReportResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory JazzReportResponse.fromMap(Map<String, dynamic> json) => JazzReportResponse(
        jazzReport: List<JazzReport>.from(json["JazzReport"].map((x) => JazzReport.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "JazzReport": List<dynamic>.from(jazzReport.map((x) => x.toMap())),
    };
}