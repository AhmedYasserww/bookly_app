part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}
class FeaturedBooksLoading extends FeaturedBooksState {}
class FeaturedBooksFailure extends FeaturedBooksState {
 final String errorMessage;
  FeaturedBooksFailure({required this.errorMessage,});
}
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> books;
  FeaturedBooksSuccess(this.books);

}
//علشان هنا يتعامل مع ليست فالافضل انى استقبل الداتا بتاعتى جوه الاستيت

