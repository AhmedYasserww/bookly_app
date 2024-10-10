import 'package:bloc/bloc.dart';
import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:bookly_app1/Features/search/data/repo/search_repo_imp.dart';
import 'package:meta/meta.dart';

part 'search_for_book_state.dart';

class SearchForBookCubit extends Cubit<SearchForBookState> {
  final SearchRepoImp searchRepoImpl;
  final String initialQuery;
  SearchForBookCubit(this.searchRepoImpl, this.initialQuery) : super(SearchForBookInitial());
  Future<void> searchForBook([String query = ""]) async {
    if (query.isEmpty) {
      emit(SearchForBookInitial());
      return;
    }

    emit(SearchForBookLoading());
    try {
      var data = await searchRepoImpl.searchForProduct(bookTitle: query);
      data.fold(
            (failure) {
          emit(SearchForBookFailure(errorMessage: failure.errorMessage));
        },
            (bookList) {
              print("***********************");
              print(bookList);
          emit(SearchForBookSuccess(bookList: bookList));
        },
      );
    } on Exception catch (e) {
      emit(SearchForBookFailure(errorMessage: e.toString()));
    }
  }

}
