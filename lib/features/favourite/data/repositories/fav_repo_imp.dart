import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/app/network_repository.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/favourite/data/data_sources/local_favourite.dart';
import 'package:operating_systems/features/favourite/domain/repositories/favourite_repo.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';

@LazySingleton(as: FavouriteRepo)
class FavoriteRepositoryImpl implements FavouriteRepo {
  final FavoriteLocalDataSource localDataSource;
  late NetworkRepository networkRepository;

  FavoriteRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Unit>> addFavorite(Question question) {
    networkRepository = getIt<NetworkRepository>();

    final addFavourite = networkRepository<Unit>(
      localDataFetcher: () => localDataSource.addToFavorite(question),
    );
    return addFavourite;
  }

  @override
  Future<Either<Failure, List<Question>>> getFavorites() {
    networkRepository = getIt<NetworkRepository>();

    final getFavourite = networkRepository<List<Question>>(
      localDataFetcher: () => localDataSource.getFavorites(),
    );
    return getFavourite;
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite(int id) {
    networkRepository = getIt<NetworkRepository>();

    final removeFavourite = networkRepository<Unit>(
      localDataFetcher: () => localDataSource.removeFromFavorite(id),
    );
    return removeFavourite;
  }
}
