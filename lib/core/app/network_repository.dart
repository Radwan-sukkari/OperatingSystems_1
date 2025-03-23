import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../errors/failuer.dart';

@injectable
class NetworkRepository {

  NetworkRepository();

  Future<Either<Failure, T>> call<T>({
    Future<T> Function()? remoteDataFetcher,
    Future<T?> Function()? localDataFetcher,
    params,
    Future<void> Function(T)? cacheData,
  }) async {
    if ( remoteDataFetcher != null) {
      try {
        final T remoteData = await remoteDataFetcher();
        if (cacheData != null) {
          await cacheData(remoteData);
        }
        return Right(remoteData);
      } catch (e) {
        print(e);
        return Left(ServerFailure());
      }
    } else {
      final T? localData = await localDataFetcher!();
      if (localData != null) {
        return Right(localData);
      } else {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
