import 'package:dartz/dartz.dart';

import '../../../../Core/errors/faluire.dart';
import '../../../home/data/models/BookModel.dart';
abstract class SearchRepo {

  Future<Either<Failure, List<BookModel>>>searchForProduct ({required String bookTitle});

}