part of 'favourite_bloc.dart';

 class FavouriteState {
   final BlocStateData<Unit> addFavouriteState;
   final BlocStateData<Unit> removeFavouriteState;
   final BlocStateData<List<Question>> getFavouriteState;


   const FavouriteState({
     this.addFavouriteState = const BlocStateData.init(),
     this.removeFavouriteState = const BlocStateData.init(),
     this.getFavouriteState = const BlocStateData.init(),
   });

   copWith(
       {
          BlocStateData<Unit> ?addFavouriteState,
          BlocStateData<Unit>? removeFavouriteState,
          BlocStateData<List<Question>> ?getFavouriteState

       }) =>
       FavouriteState(
         addFavouriteState: addFavouriteState ?? this.addFavouriteState,
         removeFavouriteState: removeFavouriteState ?? this.removeFavouriteState,
         getFavouriteState: getFavouriteState ?? this.getFavouriteState,
       );
 }

