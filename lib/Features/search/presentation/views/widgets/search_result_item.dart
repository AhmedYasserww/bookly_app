import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:bookly_app1/Features/Favorite/data/model/favorite_model.dart';
import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../home/presentation/views/widgets/book_rating.dart';
class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         GoRouter.of(context).push(AppRouter.kBookDetailsView,
           extra: bookModel
        );
      },
      child: SizedBox(
        height: 140,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: CustomBookItem(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                    "https://dummyimage.com/150x150/cccccc/000000&text=No+Image", // Provide a fallback image URL here
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      style: Styles.textStyle20(context).copyWith(
                        fontFamily: "GTSectraFine",
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    bookModel.volumeInfo.authors?.isNotEmpty ?? false
                        ? bookModel.volumeInfo.authors![0]
                        : 'Unknown author',
                    style: Styles.textStyle14(context),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Free",
                            style: Styles.textStyle20(context).copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      BookRating(
                        favoriteModel: FavoriteModel.fromBookModel(bookModel), // تحويل البيانات من BookModel إلى FavoriteModel
                        count: bookModel.volumeInfo.pageCount ?? 0,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
