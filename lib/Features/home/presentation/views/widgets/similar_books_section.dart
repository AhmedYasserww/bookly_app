import 'package:bookly_app1/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text("You can also like",
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),)),
          const SizedBox(height: 14,),
          SimilarBoxListView(),
        ],
      );

  }
}


