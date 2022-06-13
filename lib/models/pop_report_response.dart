
import 'dart:convert';
import 'package:OpaMind/models/pop_report.dart';

class PopReportResponse {
    PopReportResponse({
        required this.popReport,
    });

    List<PopReport> popReport;

    factory PopReportResponse.fromJson(String str) => PopReportResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PopReportResponse.fromMap(Map<String, dynamic> json) => PopReportResponse(
        popReport: List<PopReport>.from(json["PopReport"].map((x) => PopReport.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "PopReport": List<dynamic>.from(popReport.map((x) => x.toMap())),
    };
}