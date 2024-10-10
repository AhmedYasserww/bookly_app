part of 'search_for_book_cubit.dart';

@immutable
abstract class SearchForBookState {}

class SearchForBookInitial extends SearchForBookState {}
class SearchForBookLoading extends SearchForBookState {}
class SearchForBookSuccess extends SearchForBookState {
  List<BookModel> bookList;
  SearchForBookSuccess({required this.bookList});
}
class SearchForBookFailure extends SearchForBookState {
  final String errorMessage;
  SearchForBookFailure({required this.errorMessage});

}



