import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:bookly_app1/Features/search/presentation/manager/search_for_book_cubit.dart';
import 'package:bookly_app1/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/service_locator.dart';
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt<SearchForBookCubit>(),
      child: const Scaffold(
        body: SafeArea(child:SearchViewBody() ,),
      ),
    );
  }
}

