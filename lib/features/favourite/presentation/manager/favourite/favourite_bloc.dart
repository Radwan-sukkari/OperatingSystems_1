import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/features/favourite/domain/use_cases/add_to_favorite_use_case.dart';
import 'package:operating_systems/features/favourite/domain/use_cases/delete_from_favourite_use_case.dart';
import 'package:operating_systems/features/favourite/domain/use_cases/get_favourite_use_case.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

@injectable
class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final AddToFavouriteUseCae addToFavourite;
  final RemoveFromFavouriteUseCase removeFromFavouriteUseCase;
  final GetFavouriteUseCase getFavouriteUseCase;

  FavouriteBloc(this.addToFavourite, this.removeFromFavouriteUseCase,
      this.getFavouriteUseCase)
      : super(FavouriteState()) {
    on<AddFavouriteEvent>(addFavouriteEvent);
    on<RemoveFavouriteEvent>(removeFavouriteEvent);
    on<GetFavouriteEvent>(getFavouriteEvent);
  }

  Future<void> addFavouriteEvent(
      AddFavouriteEvent event, Emitter<FavouriteState> emit) async {
    emit(state.copWith(addFavouriteState: const BlocStateData.loading()));

    final addFavourite = await addToFavourite(event.question);

    addFavourite.fold(
      (failure) =>
          emit(state.copWith(addFavouriteState: const BlocStateData.failed())),
      (data) {
        emit(state.copWith(addFavouriteState: BlocStateData.success(data)));
        add(GetFavouriteEvent());
        event.fun();

      },
    );
  }

  Future<void> removeFavouriteEvent(
      RemoveFavouriteEvent event, Emitter<FavouriteState> emit) async {
    emit(state.copWith(removeFavouriteState: const BlocStateData.loading()));

    final removeFavourite = await removeFromFavouriteUseCase(event.id);

    removeFavourite.fold(
      (failure) => emit(
          state.copWith(removeFavouriteState: const BlocStateData.failed())),
      (data) {
        emit(state.copWith(removeFavouriteState: BlocStateData.success(data)));
        add(GetFavouriteEvent());
        event.fun();
      },
    );
  }

  Future<void> getFavouriteEvent(
      GetFavouriteEvent event, Emitter<FavouriteState> emit) async {
    emit(state.copWith(getFavouriteState: const BlocStateData.loading()));

    final getFavourite = await getFavouriteUseCase();

    getFavourite.fold(
      (failure) =>
          emit(state.copWith(getFavouriteState: const BlocStateData.failed())),
      (data) =>
          emit(state.copWith(getFavouriteState: BlocStateData.success(data))),
    );
  }
}
