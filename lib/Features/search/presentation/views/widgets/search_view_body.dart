import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:bookly_app1/Features/search/presentation/manager/search_for_book_cubit.dart';
import 'package:bookly_app1/Features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:bookly_app1/Features/search/presentation/views/widgets/search_result_List_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});


  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
   //BookModel ? bookModel;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
               Expanded(child: CustomTextField(
                 suffixIcon:IconButton(
                     onPressed:  () {
      searchController.clear();
      BlocProvider.of<SearchForBookCubit>(context).searchForBook('');
    },
                      icon: const Icon(Icons.clear)),
                 hintText: "Search For Book...",
                 // onPressed: () {
                 //   searchController.clear();
                 //   BlocProvider.of<SearchForBookCubit>(context).searchForBook('');
                 // },
                 onSubmitted: (query) {
                   context.read<SearchForBookCubit>().searchForBook(searchController.text);
                 },
                 controller: searchController,
                 onChanged: (value) {
                   context.read<SearchForBookCubit>().searchForBook(value.toString());
                 },
               )),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text("Result", style: Styles.textStyle18),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16)),
                SearchResultListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
