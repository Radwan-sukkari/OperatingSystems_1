import 'package:hive/hive.dart';
part 'favourite_model.g.dart';

@HiveType(typeId: 0)
class FavouriteQuestion extends HiveObject {
  @HiveField(0)
  final String chapterEn;
  @HiveField(1)
  final String chapterAr;
  @HiveField(2)
  final String questionEn;
  @HiveField(3)
  final String questionAr;
  @HiveField(4)
  final List<FavouriteAnswer> answers;
  @HiveField(5)
  final String? description;

  FavouriteQuestion({
    required this.chapterEn,
    required this.chapterAr,
    required this.questionEn,
    required this.questionAr,
    required this.answers,
    this.description,
  });

  factory FavouriteQuestion.fromJson(Map<String, dynamic> json) => FavouriteQuestion(
    questionEn: json["question_en"],
    questionAr: json["question_ar"],
    chapterAr: json["chapter_ar"],
    chapterEn: json["chapter_en"],
    answers:
    List<FavouriteAnswer>.from(json["answers"].map((x) => FavouriteAnswer.fromJson(x))),
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

@HiveType(typeId: 1)
class FavouriteAnswer {
  @HiveField(0)
  final String answerEn;
  @HiveField(1)
  final String answerAr;
  @HiveField(2)
  final bool isCorrect;

  FavouriteAnswer({
    required this.answerEn,
    required this.answerAr,
    required this.isCorrect,
  });

  factory FavouriteAnswer.fromJson(Map<String, dynamic> json) => FavouriteAnswer(
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