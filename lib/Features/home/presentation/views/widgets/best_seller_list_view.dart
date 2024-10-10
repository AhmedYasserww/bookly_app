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
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                  child: BookListViewItem(bookModel: state.books[index]),
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverFillRemaining(
            child: CustomErrorWidget(errorMessage: state.errorMessage),
          );
        } else {
          return const SliverFillRemaining(
            child: CustomLoadingIndicator(),
          );
        }
      },
    );
  }
}
