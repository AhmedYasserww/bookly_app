import 'package:bookly_app1/Features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_widget_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksState>(

      builder: (context, state) {
        if (state is NewestBooksSuccess){
          return ListView.builder(

              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, i) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: BookListViewItem(bookModel: state.books[i],));
              });
        }
        else if(state is NewestBooksFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        else {
          return const CustomLoadingIndicator();
        }

      },
    );
  }
}
