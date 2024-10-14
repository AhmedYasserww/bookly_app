
import 'package:bookly_app1/Features/Favorite/data/model/favorite_model.dart';
import 'package:bookly_app1/Features/Favorite/presentation/manager/add_book_to_favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/utils/service_locator.dart';
import '../../../../../constants.dart';
class AddToFavoriteWidget extends StatelessWidget {
  const AddToFavoriteWidget({super.key, required this.favoriteModel});
  final FavoriteModel favoriteModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddBooKtoFavoriteCubit, AddBooKtoFavoriteState>(
      listener: (context, state) {
        if (state is AddBooKtoFavoriteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        final isSelected = state is AddBooKtoFavoriteSuccess
            ? state.favoriteBooks.any((product) => product.title == favoriteModel.title)
            : false;

        return IconButton(
          onPressed: () {
            final cubit = context.read<AddBooKtoFavoriteCubit>();  // Use context.read
            cubit.toggleFavorite(favoriteModel);
          },
          icon: isSelected
              ? const Icon(Icons.favorite, color: Colors.red,size: 32,)
              : const Icon(Icons.favorite_border, color: Colors.red,size: 32,),
        );
      },
    );
  }
}



