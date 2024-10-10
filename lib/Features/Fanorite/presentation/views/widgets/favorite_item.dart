import 'package:bookly_app1/Features/Fanorite/presentation/views/widgets/favorite_item_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../home/presentation/views/widgets/custom_book_item.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

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
                offset:  Offset(0, 5),
              ),
            ],
          ),
          child: SizedBox(
            height: 180,
            child: Row(
              children: [
                const CustomBookItem(
                  imageUrl:
                  "http://books.google.com/books/content?id=Y4p4wwqC5H0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: FavoriteItemDetails()
                ),
                const SizedBox(width: 10),
                // زر المفضلة
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      // إزالة من المفضلة
                    },
                    icon: const Icon(
                      FontAwesomeIcons.xmark,
                      color: Colors.white54,  // لون الأيقونة في الوضع الليلي
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
