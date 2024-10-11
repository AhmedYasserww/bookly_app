import 'package:bloc/bloc.dart';
import 'package:bookly_app1/Features/Fanorite/data/model/favorite_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../constants.dart';

part 'add_book_to_favorite_state.dart';

class AddBooKtoFavoriteCubit extends Cubit<AddBooKtoFavoriteState> {
  AddBooKtoFavoriteCubit() : super(AddBooKtoFavoriteInitial());

  Future<void> toggleFavorite(FavoriteModel favoriteBook) async {
    emit(AddBooKtoFavoriteLoading());
    try {
      var favoriteBox = Hive.box<FavoriteModel>(kFavoriteBox);
      bool bookExists = favoriteBox.values.any((product) => product.title == favoriteBook.title);

      if (bookExists) {
        await removeFromFavorites(favoriteBook);
        emit(AddBooKtoFavoriteSuccess(
          favoriteBooks: favoriteBox.values.toList(),
        ));
      } else {
        await addToFavorites(favoriteBook);
        emit(AddBooKtoFavoriteSuccess(
          favoriteBooks: favoriteBox.values.toList(),
        ));
      }
    } on Exception catch (e) {
      emit(AddBooKtoFavoriteFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addToFavorites(FavoriteModel favoriteBook) async {
    final favoriteBox = Hive.box<FavoriteModel>(kFavoriteBox);
    await favoriteBox.add(favoriteBook);
  }

  Future<void> removeFromFavorites(FavoriteModel favoriteBook) async {
    final favoriteBox = Hive.box<FavoriteModel>(kFavoriteBox);
    final keyToRemove = favoriteBox.keys.firstWhere(
          (key) => favoriteBox.get(key)?.title == favoriteBook.title,
    );
    await favoriteBox.delete(keyToRemove);
  }


  Future<void> fetchFavoriteProducts() async {
    emit(AddBooKtoFavoriteLoading());
    try {
      final favoriteBox = Hive.box<FavoriteModel>(kFavoriteBox);
      final favoriteProducts = favoriteBox.values.toList();
      emit(AddBooKtoFavoriteSuccess(
        favoriteBooks: favoriteProducts,
      ));
    } on Exception catch (e) {
      emit(AddBooKtoFavoriteFailure(errorMessage: e.toString()));
    }
  }
}
