import 'package:bookly_app1/Features/Fanorite/presentation/views/widgets/favorite_item_list_view.dart';
import 'package:flutter/material.dart';
class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Favorite"),
      ),
      body: Column(
        children: [
          Expanded(child: FavoriteItemListView())
        ],
      ),
    );
  }
}
