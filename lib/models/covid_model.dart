import 'dart:convert';

import 'package:meta/meta.dart';

List<CovidTotalModel> covidModelFromJson(String str) =>
    List<CovidTotalModel>.from(json.decode(str).map((x) => CovidTotalModel.fromJson(x)));

String covidModelToJson(List<CovidTotalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CovidTotalModel {
  CovidTotalModel({
    @required this.activeCasesText,
    @required this.countryText,
    @required this.lastUpdate,
    @required this.newCasesText,
    @required this.newDeathsText,
    @required this.totalCasesText,
    @required this.totalDeathsText,
    @required this.totalRecoveredText,
  });

  final String activeCasesText;
  final String countryText;
  final String lastUpdate;
  final String newCasesText;
  final String newDeathsText;
  final String totalCasesText;
  final String totalDeathsText;
  final String totalRecoveredText;

  factory CovidTotalModel.fromJson(Map<String, dynamic> json) => CovidTotalModel(
        activeCasesText: json["Active Cases_text"] == null
            ? null
            : json["Active Cases_text"],
        countryText: json["Country_text"] == null
            ? null
            : json["Country_text"].toString().replaceAll(",", "."),
        lastUpdate: json["Last Update"] == null ? null : json["Last Update"],
        newCasesText: json["New Cases_text"] == null
            ? null
            : json["New Cases_text"] != ""
                ? json["New Cases_text"].toString().replaceAll(",", ".")
                : "...",
        newDeathsText: json["New Deaths_text"] == null
            ? null
            : json["New Deaths_text"].toString().replaceAll(",", "."),
        totalCasesText: json["Total Cases_text"] == null
            ? null
            : json["Total Cases_text"].toString().replaceAll(",", "."),
        totalDeathsText: json["Total Deaths_text"] == null
            ? null
            : json["Total Deaths_text"].toString().replaceAll(",", "."),
        totalRecoveredText: json["Total Recovered_text"] == null
            ? null
            : json["Total Recovered_text"].toString().replaceAll(",", "."),
      );

  Map<String, dynamic> toJson() => {
        "Active Cases_text": activeCasesText == null ? null : activeCasesText,
        "Country_text": countryText == null ? null : countryText,
        "Last Update": lastUpdate == null ? null : lastUpdate,
        "New Cases_text": newCasesText == null ? null : newCasesText,
        "New Deaths_text": newDeathsText == null ? null : newDeathsText,
        "Total Cases_text": totalCasesText == null ? null : totalCasesText,
        "Total Deaths_text": totalDeathsText == null ? null : totalDeathsText,
        "Total Recovered_text":
            totalRecoveredText == null ? null : totalRecoveredText,
      };
}

class WorldCovid {
  String title;
  String iconUrl;
  dynamic value;
  WorldCovid({this.title, this.iconUrl, this.value});
}

class GridCovidModel {
  String urlIcon;
  String title;
  String value;
  GridCovidModel({this.urlIcon, this.title, this.value});
}