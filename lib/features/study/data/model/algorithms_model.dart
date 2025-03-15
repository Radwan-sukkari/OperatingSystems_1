// To parse this JSON data, do
//
//     final algorithmsModel = algorithmsModelFromJson(jsonString);

import 'dart:convert';

AlgorithmsModel algorithmsModelFromJson(String str) => AlgorithmsModel.fromJson(json.decode(str));

String algorithmsModelToJson(AlgorithmsModel data) => json.encode(data.toJson());

class AlgorithmsModel {
  final List<Algorithm> algorithms;

  AlgorithmsModel({
    required this.algorithms,
  });

  factory AlgorithmsModel.fromJson(Map<String, dynamic> json) => AlgorithmsModel(
    algorithms: List<Algorithm>.from(json["algorithms"].map((x) => Algorithm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "algorithms": List<dynamic>.from(algorithms.map((x) => x.toJson())),
  };
}

class Algorithm {
  final int id;
  final String algorithmName;
  final String examQuestion;
  final String firstName;
  final String secondName;
  final List<AlgorithmBody> algorithmBody;

  Algorithm({
    required this.id,
    required this.algorithmName,
    required this.examQuestion,
    required this.firstName,
    required this.secondName,
    required this.algorithmBody,
  });

  factory Algorithm.fromJson(Map<String, dynamic> json) => Algorithm(
    id: json["id"],
    algorithmName: json["algorithm_name"],
    examQuestion: json["exam_question"],
    firstName: json["first_name"],
    secondName: json["second_name"],
    algorithmBody: List<AlgorithmBody>.from(json["algorithm_body"].map((x) => AlgorithmBody.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "algorithm_name": algorithmName,
    "exam_question": examQuestion,
    "first_name": firstName,
    "second_name": secondName,
    "algorithm_body": List<dynamic>.from(algorithmBody.map((x) => x.toJson())),
  };
}

class AlgorithmBody {
  final List<String> system;
  final List<String> thread1;
  final List<String> thread2;

  AlgorithmBody({
    required this.system,
    required this.thread1,
    required this.thread2,
  });

  factory AlgorithmBody.fromJson(Map<String, dynamic> json) => AlgorithmBody(
    system: List<String>.from(json["system"].map((x) => x)),
    thread1: List<String>.from(json["thread 1"].map((x) => x)),
    thread2: List<String>.from(json["thread2"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "system": List<dynamic>.from(system.map((x) => x)),
    "thread 1": List<dynamic>.from(thread1.map((x) => x)),
    "thread2": List<dynamic>.from(thread2.map((x) => x)),
  };
}
