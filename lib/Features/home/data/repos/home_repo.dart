
import 'package:bookly_app1/Core/errors/faluire.dart';
import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>>fetchNewestBooks();
  Future<Either<Failure,List<BookModel>>>fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>>fetchSimilarBooks();

}
//Either دى كعناها ان فيه حاجتين هيرجعو فى المستقبل
//left ---> فيه مشكله
//right ----> مفيش مشكله او بمعنى اصح الريترن الصح بتاع الميثود دى
