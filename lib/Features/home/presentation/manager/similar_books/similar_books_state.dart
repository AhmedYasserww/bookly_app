part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksLoading extends SimilarBooksState {}
class SimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;
  SimilarBooksFailure({required this.errorMessage});
}
class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;
  SimilarBooksSuccess({required this.books});
}

