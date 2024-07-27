import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/BookModel.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks();

    result.fold((failure) =>
        emit(SimilarBooksFailure(errorMessage: failure.errorMessage)),
            (books) => emit(SimilarBooksSuccess(books: books)));
  }
}
