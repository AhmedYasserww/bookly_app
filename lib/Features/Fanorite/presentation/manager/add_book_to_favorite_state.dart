part of 'add_book_to_favorite_cubit.dart';

@immutable
abstract class AddBooKtoFavoriteState {}

class AddBooKtoFavoriteInitial extends AddBooKtoFavoriteState {}
class AddBooKtoFavoriteLoading extends AddBooKtoFavoriteState {}
class AddBooKtoFavoriteSuccess extends AddBooKtoFavoriteState {
  final List<FavoriteModel> favoriteBooks;
   AddBooKtoFavoriteSuccess({required this.favoriteBooks});
}
class AddBooKtoFavoriteFailure extends AddBooKtoFavoriteState {
  final String errorMessage;
  AddBooKtoFavoriteFailure({required this.errorMessage});
}

