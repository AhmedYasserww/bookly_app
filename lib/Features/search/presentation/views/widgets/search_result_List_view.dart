import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_empty_screen.dart';
import 'package:bookly_app1/Features/search/presentation/manager/search_for_book_cubit.dart';
import 'package:bookly_app1/Features/search/presentation/views/widgets/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/views/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/views/widgets/custom_widget_error.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForBookCubit, SearchForBookState>(
      builder: (context, state) {
        if (state is SearchForBookLoading) {
          return const SliverFillRemaining(
            child: Center(child: CustomLoadingIndicator()),
          );
        } else if (state is SearchForBookSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SearchResultItem(bookModel: state.bookList[index]),
                );
              },
              childCount: state.bookList.length,
            ),
          );
        } else if (state is SearchForBookFailure) {
          return SliverFillRemaining(
            child: CustomErrorWidget(errorMessage: state.errorMessage),
          );
        } else {
          return  const SliverFillRemaining(
            child: CustomEmptyScreen(message: "Search For Products..."),
          );
        }
      },
    );
  }
}

