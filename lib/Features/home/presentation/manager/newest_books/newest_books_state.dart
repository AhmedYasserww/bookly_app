part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}
class NewestBooksLoading extends NewestBooksState {}
class NewestBooksSuccess extends NewestBooksState {
  List<BookModel> books;
  NewestBooksSuccess({required this.books});
}
class NewestBooksFailure extends NewestBooksState {
  final String errorMessage ;
  NewestBooksFailure({required this.errorMessage});
}

