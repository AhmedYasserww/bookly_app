
import 'package:bookly_app1/Core/utils/api_service.dart';
import 'package:bookly_app1/Features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/errors/faluire.dart';
import '../models/BookModel.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=computer science&Sorting=newest');
      print('Newest Books API Response: $data');
      List<BookModel> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioError) {
        print('DioError occurred: ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      print('Exception occurred: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      print('Featured Books API Response: $data');
      List<BookModel> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioError) {
        print('DioError occurred: ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      print('Exception occurred: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks() async {
    try {
      var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:data science&Sorting=relevance');
      print('Featured Books API Response: $data');
      List<BookModel> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioError) {
        print('DioError occurred: ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      print('Exception occurred: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

}