import 'package:bloc/bloc.dart';
import 'package:bookly_app1/Features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';
import '../../../data/models/BookModel.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    try {
      var result = await homeRepo.fetchFeaturedBooks();
      result.fold(
            (failure) {
          print('Fetch failed: ${failure.errorMessage}');
          emit(FeaturedBooksFailure(errorMessage: failure.errorMessage));
        },
            (books) {
          print('Fetch successful');
          emit(FeaturedBooksSuccess(books));
        },
      );
    } catch (e) {
      print('Exception occurred: $e');
      emit(FeaturedBooksFailure(errorMessage: e.toString()));
    }
  }
}
