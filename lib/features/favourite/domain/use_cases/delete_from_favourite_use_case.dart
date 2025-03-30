import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/favourite/domain/repositories/favourite_repo.dart';
@lazySingleton
class RemoveFromFavouriteUseCase {
  final FavouriteRepo favouriteRepo;

  RemoveFromFavouriteUseCase({required this.favouriteRepo});
  Future<Either<Failure, Unit>> call(String id)=>favouriteRepo.removeFavorite(id);


}