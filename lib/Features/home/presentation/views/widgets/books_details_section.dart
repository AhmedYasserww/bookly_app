import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key,required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .2),
            child: CustomBookItem(
              imageUrl:(bookModel.volumeInfo.imageLinks?.thumbnail)??"https://via.placeholder.com/150",
            )),
        const SizedBox(
          height: 20,
        ),
        Text(
          maxLines: 2,
          bookModel.volumeInfo.title!,
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold,),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0]??'',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(
          height: 14,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,

          //rating:bookModel.volumeInfo.averageRating??0,
          count: bookModel.volumeInfo.pageCount ?? 0,

        ),
        SizedBox(
          height: 25,
        ),
        BooksActions(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
