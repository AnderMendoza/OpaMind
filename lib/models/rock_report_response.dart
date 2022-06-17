
import 'dart:convert';
import 'package:OpaMind/models/rock_report.dart';

class RockReportResponse {
    RockReportResponse({
        required this.rockReport,
    });

    List<RockReport> rockReport;

    factory RockReportResponse.fromJson(String str) => RockReportResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RockReportResponse.fromMap(Map<String, dynamic> json) => RockReportResponse(
        rockReport: List<RockReport>.from(json["RockReport"].map((x) => RockReport.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "RockReport": List<dynamic>.from(rockReport.map((x) => x.toMap())),
    };
}