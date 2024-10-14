import 'package:bookly_app1/Features/Favorite/presentation/manager/add_book_to_favorite_cubit.dart';
import 'package:bookly_app1/Features/Favorite/presentation/views/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_empty_screen.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_widget_error.dart';

class FavoriteItemListView extends StatelessWidget {
  const FavoriteItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AddBooKtoFavoriteCubit>().fetchFavoriteProducts();

    return BlocBuilder<AddBooKtoFavoriteCubit, AddBooKtoFavoriteState>(
      builder: (context, state) {
        if (state is AddBooKtoFavoriteLoading) {
          return const CustomLoadingIndicator();
        } else if (state is AddBooKtoFavoriteFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is AddBooKtoFavoriteSuccess) {
          final favoriteBooks = state.favoriteBooks;
          if (favoriteBooks.isEmpty) {
            return const CustomEmptyScreen(message: "No item added yet");
          }
          return ListView.builder(
            itemCount: favoriteBooks.length,
            itemBuilder: (context, i) {
              return FavoriteItem(favoriteModel: favoriteBooks[i]);
            },
          );
        } else {
          return const CustomEmptyScreen(message: 'No items added yet.');
        }
      },
    );
  }
}
