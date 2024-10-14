import 'package:bookly_app1/Features/Favorite/data/model/favorite_model.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/book_rating.dart';
class FavoriteItemDetails extends StatelessWidget {
  const FavoriteItemDetails({super.key, required this.favoriteModel});
final FavoriteModel favoriteModel ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16,),
        Text(
          favoriteModel.title,
          style: Styles.textStyle20(context).copyWith(
            fontFamily: "GTSectraFine",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        // المؤلف
        Text(
        favoriteModel.author,
          style: Styles.textStyle14(context).copyWith(
            color: Colors.grey.shade400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              "Free",
              style: Styles.textStyle20(context).copyWith(
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
             BookRating(
                 favoriteModel: favoriteModel,

                 showFavoriteIcon: false,
              count: favoriteModel.count
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          favoriteModel.publisher,
          style: Styles.textStyle14(context).copyWith(
            color: Colors.grey.shade400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
