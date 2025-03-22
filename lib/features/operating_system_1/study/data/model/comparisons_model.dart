// To parse this JSON data, do
//
//     final comparisonsModel = comparisonsModelFromJson(jsonString);

import 'dart:convert';

ComparisonsModel comparisonsModelFromJson(String str) =>
    ComparisonsModel.fromJson(json.decode(str));

String comparisonsModelToJson(ComparisonsModel data) =>
    json.encode(data.toJson());

class ComparisonsModel {
  final List<Chapter> chapters;

  ComparisonsModel({
    required this.chapters,
  });

  factory ComparisonsModel.fromJson(Map<String, dynamic> json) =>
      ComparisonsModel(
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
      };
}

class Chapter {
  final int id;
  final String titleEn;
  final String titleAr;
  final List<Comparison> comparisons;

  Chapter({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.comparisons,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      Chapter(
        id: json["id"],
        titleEn: json["title_en"],
        titleAr: json["title_ar"],
        comparisons: List<Comparison>.from(
            json["Comparisons"].map((x) => Comparison.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "title_en": titleEn,
        "title_ar": titleAr,
        "Comparisons": List<dynamic>.from(comparisons.map((x) => x.toJson())),
      };
}

class Comparison {
  final String notes;
  final String tableTitle;
  final List<String> firstColumn;
  final List<String> mainColumnHeadings;
  final List<List<String>> rows;

  Comparison({
    required this.notes,
    required this.tableTitle,
    required this.firstColumn,
    required this.mainColumnHeadings,
    required this.rows,
  });

  factory Comparison.fromJson(Map<String, dynamic> json) =>
      Comparison(
        notes: json["notes"],
        tableTitle: json["tableTitle"],
        firstColumn: List<String>.from(json["firstColumn"].map((x) => x)),
        mainColumnHeadings:
        List<String>.from(json["mainColumnHeadings"].map((x) => x)),
        rows: List<List<String>>.from(
            json["rows"].map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() =>
      {
        "notes": notes,
        "tableTitle": tableTitle,
        "firstColumn": List<dynamic>.from(firstColumn.map((x) => x)),
        "mainColumnHeadings":
        List<dynamic>.from(mainColumnHeadings.map((x) => x)),
        "rows": List<dynamic>.from(
            rows.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
