// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
  final List<Chapter> chapters;

  QuizModel({
    required this.chapters,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
      };
}

class Chapter {
  final int id;
  final String titleEn;
  final String titleAr;
  final List<Question> questions;

  Chapter({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.questions,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        titleEn: json["title_en"],
        titleAr: json["title_ar"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_en": titleEn,
        "title_ar": titleAr,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  final String chapterEn;
  final String chapterAr;
  final String questionEn;
  final String questionAr;
  final List<Answer> answers;
  final String? description;

  Question({
    required this.chapterEn,
    required this.chapterAr,
    required this.questionEn,
    required this.questionAr,
    required this.answers,
    this.description,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionEn: json["question_en"],
        questionAr: json["question_ar"],
        chapterAr: json["chapter_ar"],
        chapterEn: json["chapter_en"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "question_en": questionEn,
        "question_ar": questionAr,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "description": description,
        "chapter_en": chapterEn,
        "chapter_ar": chapterAr
      };
}

class Answer {
  final String answerEn;
  final String answerAr;
  final bool isCorrect;

  Answer({
    required this.answerEn,
    required this.answerAr,
    required this.isCorrect,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answerEn: json["answer_en"],
        answerAr: json["answer_ar"],
        isCorrect: json["is_correct"],
      );

  Map<String, dynamic> toJson() => {
        "answer_en": answerEn,
        "answer_ar": answerAr,
        "is_correct": isCorrect,
      };
}
