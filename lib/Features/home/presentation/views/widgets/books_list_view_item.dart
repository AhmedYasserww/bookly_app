import 'package:bookly_app1/Core/utils/app_router.dart';
import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:bookly_app1/Features/Favorite/data/model/favorite_model.dart';
import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 140,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Adjust the width ratio for the image
            Expanded(
              flex: 3,
              child: CustomBookItem(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? "https://dummyimage.com/150x150/cccccc/000000&text=No+Image",
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      style: Styles.textStyle20(context).copyWith(fontFamily: "GTSectraFine"),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 2),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      bookModel.volumeInfo.authors?.isNotEmpty ?? false
                          ? bookModel.volumeInfo.authors![0]
                          : 'Unknown author',
                      style: Styles.textStyle14(context),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Free",
                          style: Styles.textStyle20(context).copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      BookRating(
                          favoriteModel: FavoriteModel.fromBookModel(bookModel),
                          count: bookModel.volumeInfo.pageCount ?? 0,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
