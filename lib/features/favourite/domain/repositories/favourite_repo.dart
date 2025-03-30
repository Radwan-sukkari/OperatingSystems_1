import 'package:dartz/dartz.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';

abstract  class FavouriteRepo{
  Future<Either<Failure, Unit>> addFavorite(Question question);
  Future<Either<Failure, Unit>> removeFavorite(String id);
  Future<Either<Failure, List<Question>>> getFavorites();

}