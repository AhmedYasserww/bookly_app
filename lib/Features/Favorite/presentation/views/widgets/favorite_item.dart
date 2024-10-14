import 'package:bookly_app1/Features/Favorite/data/model/favorite_model.dart';
import 'package:bookly_app1/Features/Favorite/presentation/views/widgets/favorite_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../home/presentation/views/widgets/custom_book_item.dart';
import '../../manager/add_book_to_favorite_cubit.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.favoriteModel});
  final FavoriteModel favoriteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Go to book details
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: SizedBox(
            height: 180,
            child: Row(
              children: [
                CustomBookItem(imageUrl: favoriteModel.image),
                const SizedBox(width: 20),
                Expanded(
                  child: FavoriteItemDetails(favoriteModel: favoriteModel),
                ),
                const SizedBox(width: 10),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () async {
                      BlocProvider.of<AddBooKtoFavoriteCubit>(context)
                          .toggleFavorite(favoriteModel);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.xmark,
                      color: Colors.white54,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
