part of 'favourite_bloc.dart';

 class FavouriteEvent {}
class GetFavouriteEvent extends FavouriteEvent{}
class AddFavouriteEvent extends FavouriteEvent{
  final Question question;

  AddFavouriteEvent({required this.question});
}
class RemoveFavouriteEvent extends FavouriteEvent{
   final String id;

  RemoveFavouriteEvent({required this.id});

}

