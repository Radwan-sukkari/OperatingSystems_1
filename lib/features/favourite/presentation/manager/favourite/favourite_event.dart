part of 'favourite_bloc.dart';

class FavouriteEvent {}

class GetFavouriteEvent extends FavouriteEvent {}

class AddFavouriteEvent extends FavouriteEvent {
  final Question question;
  final VoidCallback fun;

  AddFavouriteEvent({required this.question, required this.fun});
}

class RemoveFavouriteEvent extends FavouriteEvent {
  final int id;
  final VoidCallback fun;

  RemoveFavouriteEvent({required this.id, required this.fun});
}
