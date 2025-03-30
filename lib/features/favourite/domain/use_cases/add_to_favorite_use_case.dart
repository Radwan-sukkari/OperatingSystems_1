import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/favourite/domain/repositories/favourite_repo.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
@lazySingleton
class AddToFavouriteUseCae {
  final FavouriteRepo favouriteRepo;

  AddToFavouriteUseCae({required this.favouriteRepo});

  Future<Either<Failure, Unit>> call(Question question) =>
      favouriteRepo.addFavorite(question);
}
