import 'package:bookly_app1/Features/Fanorite/data/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../Fanorite/presentation/views/widgets/add_to_favorite.dart';
import '../../../../../Core/utils/styles.dart';

class BookRating extends StatelessWidget {
  final FavoriteModel favoriteModel;
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.count,
    this.showFavoriteIcon = true, // new parameter to control visibility of the favorite icon
    required this.favoriteModel,  // FavoriteModel is required here
  });

  final int count;
  final bool showFavoriteIcon;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 17,
        ),
        const SizedBox(width: 6.3),
        Opacity(
          opacity: .5,
          child: Text(
            "($count)",
            style: Styles.textStyle14.copyWith(
              color: const Color(0xffFFFFFF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (showFavoriteIcon) // Show favorite icon if condition is true
          Padding(
            padding: const EdgeInsets.only(left: 8.0), // Add spacing
            child: AddToFavoriteWidget(favoriteModel: favoriteModel),
          ),
      ],
    );
  }
}
