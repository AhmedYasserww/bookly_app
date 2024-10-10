import 'package:bookly_app1/Features/Fanorite/presentation/views/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
class FavoriteItemListView extends StatelessWidget {
  const FavoriteItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (context,i){
      return const FavoriteItem();
    });
  }
}
