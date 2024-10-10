import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/book_rating.dart';
class FavoriteItemDetails extends StatelessWidget {
  const FavoriteItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hedley Marston and the British Bomb Tests in Australia",
          style: Styles.textStyle20.copyWith(
            fontFamily: "GTSectraFine",
            fontWeight: FontWeight.bold,
            color: Colors.white,  // لون النص فاتح للوضع الليلي
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        // المؤلف
        Text(
          "By: John Doe",
          style: Styles.textStyle14.copyWith(
            color: Colors.grey.shade400,  // لون نص أفتح
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        // الصف الخاص بالسعر والتقييم
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // السعر
            Text(
              "Free",
              style: Styles.textStyle20.copyWith(
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            // التقييم
            const BookRating(
              showFavoriteIcon: false,
              count: 120,
              //rating: 4.5,
            ),
          ],
        ),
        const SizedBox(height: 8),
        // معلومات الناشر
        Text(
          "Publisher: ABC Publishing",
          style: Styles.textStyle14.copyWith(
            color: Colors.grey.shade400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
