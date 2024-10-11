import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key,required this.bookModel});
  final BookModel bookModel ;
  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SafeArea(child: CustomAppBarBookDetails()),
              BooksDetailsSection(bookModel: bookModel,),
              const Expanded(
                  child:
                   SizedBox(height: 30,),
              ),
             const SimilarBooksSection(),
             const SizedBox(height: 20,)

            ],
          ),
        ) ,)
      ],
    );

  }
}


