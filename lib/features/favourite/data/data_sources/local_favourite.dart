import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';

abstract class FavoriteLocalDataSource {
  Future<Unit> addToFavorite(Question question);

  Future<Unit> removeFromFavorite(String id);

  Future<List<Question>> getFavorites();
}
@LazySingleton(as: FavoriteLocalDataSource)
class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final Box<Question> box;

  FavoriteLocalDataSourceImpl(this.box);

  @override
  Future<Unit> addToFavorite(Question question) async {
    final key = generateSafeKey(question.questionAr);
    await box.put(key, question);
    return unit;
  }

  @override
  Future<Unit> removeFromFavorite(String id) async {
    await box.delete(id);
    print("removed");
    return unit;
  }

  @override
  Future<List<Question>> getFavorites() async {
    return box.values.toList();
  }


  String generateSafeKey(String input) {
    return sha256.convert(utf8.encode(input)).toString();
  }
}
