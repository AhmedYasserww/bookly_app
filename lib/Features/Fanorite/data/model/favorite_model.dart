import 'package:hive/hive.dart';
import 'package:bookly_app1/Features/home/data/models/BookModel.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 1)  // Provide a unique typeId for your model.
class FavoriteModel {
  @HiveField(0)
  final String image;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final String publisher;

  @HiveField(4)
  final int count;

  FavoriteModel({
    required this.image,
    required this.title,
    required this.author,
    required this.publisher,
    required this.count,
  });

  // Factory constructor to create a FavoriteModel from a BookModel.
  factory FavoriteModel.fromBookModel(BookModel book) {
    return FavoriteModel(
      image: book.volumeInfo.imageLinks?.thumbnail ?? '',
      title: book.volumeInfo.title ?? '',
      author: book.volumeInfo.authors?.isNotEmpty == true ? book.volumeInfo.authors![0] : 'Unknown',
      count: book.volumeInfo.pageCount ?? 0,
      publisher: book.volumeInfo.publisher ?? 'Unknown',
    );
  }
}
