import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/favourite/domain/repositories/favourite_repo.dart';

import '../../../operating_system_1/quiz/data/model/quiz_model.dart';
@lazySingleton
class GetFavouriteUseCase {
  final FavouriteRepo favouriteRepo;

  GetFavouriteUseCase({required this.favouriteRepo});

  Future<Either<Failure, List<Question>>> call() =>
      favouriteRepo.getFavorites();
}
