part of 'favourites_cubit.dart';

@immutable
abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}
class InsertFavouritesLoadingState extends FavouritesState {}
class InsertFavouritesSuccessState extends FavouritesState {
}
class InsertFavouritesErrorState extends FavouritesState {}
class GetFavouritesLoadingState extends FavouritesState {}
class GetFavouritesSuccessState extends FavouritesState {
  final List<Map<String, Object?>> ? favouritesList ;

  GetFavouritesSuccessState(this.favouritesList);

}
class GetFavouritesErrorState extends FavouritesState {
  final String error;

  GetFavouritesErrorState(this.error);
}
