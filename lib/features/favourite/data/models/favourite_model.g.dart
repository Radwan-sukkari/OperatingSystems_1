// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteQuestionAdapter extends TypeAdapter<FavouriteQuestion> {
  @override
  final int typeId = 0;

  @override
  FavouriteQuestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteQuestion(
      chapterEn: fields[0] as String,
      chapterAr: fields[1] as String,
      questionEn: fields[2] as String,
      questionAr: fields[3] as String,
      answers: (fields[4] as List).cast<FavouriteAnswer>(),
      description: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteQuestion obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.chapterEn)
      ..writeByte(1)
      ..write(obj.chapterAr)
      ..writeByte(2)
      ..write(obj.questionEn)
      ..writeByte(3)
      ..write(obj.questionAr)
      ..writeByte(4)
      ..write(obj.answers)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FavouriteAnswerAdapter extends TypeAdapter<FavouriteAnswer> {
  @override
  final int typeId = 1;

  @override
  FavouriteAnswer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteAnswer(
      answerEn: fields[0] as String,
      answerAr: fields[1] as String,
      isCorrect: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteAnswer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.answerEn)
      ..writeByte(1)
      ..write(obj.answerAr)
      ..writeByte(2)
      ..write(obj.isCorrect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteAnswerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
