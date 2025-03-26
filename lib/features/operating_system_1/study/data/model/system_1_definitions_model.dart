// To parse this JSON data, do
//
//     final systemDefinitionsModel = systemDefinitionsModelFromJson(jsonString);

import 'dart:convert';

SystemDefinitionsModel systemDefinitionsModelFromJson(String str) => SystemDefinitionsModel.fromJson(json.decode(str));

String systemDefinitionsModelToJson(SystemDefinitionsModel data) => json.encode(data.toJson());

class SystemDefinitionsModel {
  List<SystemDefinition> systemDefinitions;

  SystemDefinitionsModel({
    required this.systemDefinitions,
  });

  factory SystemDefinitionsModel.fromJson(Map<String, dynamic> json) => SystemDefinitionsModel(
    systemDefinitions: List<SystemDefinition>.from(json["system_definitions"].map((x) => SystemDefinition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "system_definitions": List<dynamic>.from(systemDefinitions.map((x) => x.toJson())),
  };
}

class SystemDefinition {
  int id;
  String pdfNumberArabic;
  String pdfNumberEn;
  List<Definition> definitions;

  SystemDefinition({
    required this.id,
    required this.pdfNumberArabic,
    required this.pdfNumberEn,
    required this.definitions,
  });

  factory SystemDefinition.fromJson(Map<String, dynamic> json) => SystemDefinition(
    id: json["id"],
    pdfNumberArabic: json["pdf_number_arabic"],
    pdfNumberEn: json["pdf_number_en"],
    definitions: List<Definition>.from(json["definitions"].map((x) => Definition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pdf_number_arabic": pdfNumberArabic,
    "pdf_number_en": pdfNumberEn,
    "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
  };
}

class Definition {
  String title;
  String titleEn;
  String explain;
  String note;
  String? whichCourse;


  Definition({
    required this.title,
    required this.titleEn,
    required this.explain,
    required this.note,
     this.whichCourse
  });

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
    title: json["title"],
    titleEn: json["title_en"],
    explain: json["explain"],
    note: json["note"],
    whichCourse: json["whichCourse"]
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "title_en": titleEn,
    "explain": explain,
    "note": note,
    "whichCourse":whichCourse
  };
}
