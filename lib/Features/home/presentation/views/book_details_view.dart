import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:bookly_app1/Features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BookDetailsView extends StatefulWidget {
  const BookDetailsView ({super.key,required this.bookModel});
  final BookModel bookModel ;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category:widget.bookModel.volumeInfo.categories![0]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(bookModel:widget.bookModel,),
    );
  }
}
