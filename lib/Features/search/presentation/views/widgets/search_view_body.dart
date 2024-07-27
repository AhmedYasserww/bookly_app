import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:bookly_app1/Features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomTextField(),
        ),
       const SizedBox(height: 16),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text("Result", style: Styles.textStyle18),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                     // child: BookListViewItem(),
                      child: Text("data"),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


