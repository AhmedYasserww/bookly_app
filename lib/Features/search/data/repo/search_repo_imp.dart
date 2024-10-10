import 'package:bookly_app1/Core/utils/api_service.dart';
import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:bookly_app1/Features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/errors/faluire.dart';


class SearchRepoImp implements SearchRepo {
  final ApiService apiService;
  SearchRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> searchForProduct({required String bookTitle}) async {
    try {
      var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=$bookTitle');
      print("returned data successfully $data");
      List <BookModel>bookList = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          bookList.add(BookModel.fromJson(item));
        }
      }

      else {
        return Left(ServerFailure(errorMessage: "no item found "));
      }
      return right(bookList);
    } on Exception catch (e) {
      if (e is DioException) {
        print("dioErrorException${e.message}");
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }



}

