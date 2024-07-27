import 'package:bookly_app1/Features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:flutter/material.dart';
class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
         // child: BookListViewItem(),
          child: Text("gggg"),
        );
      },
    );
  }
}