import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:bookly_app1/Features/Fanorite/presentation/views/widgets/favorite_item_list_view.dart';
import 'package:flutter/material.dart';
class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your Favorite",style: Styles.textStyle30,),
      ),
      body: const Column(
        children: [
          Expanded(child: FavoriteItemListView())
        ],
      ),
    );
  }
}
