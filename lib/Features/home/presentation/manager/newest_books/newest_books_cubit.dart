import 'package:bloc/bloc.dart';
import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();

    result.fold((failure) =>
        emit(NewestBooksFailure(errorMessage: failure.errorMessage)),
            (books) => emit(NewestBooksSuccess(books: books)));
  }
}
