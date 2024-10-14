import 'package:bookly_app1/Core/utils/app_router.dart';
import 'package:bookly_app1/Features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_widget_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class SimilarBoxListView extends StatelessWidget {
  const SimilarBoxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
  builder: (context, state) {
    if(state is SimilarBooksSuccess){
      return SizedBox(
        height:MediaQuery.of(context).size.height * .20,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length,
            itemBuilder:(context,i){

              return Padding(

                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[i]);
                  },
                    child: CustomBookItem(imageUrl: state.books[i].volumeInfo.imageLinks?.thumbnail?? "https://dummyimage.com/150x150/cccccc/000000&text=No+Image"
                      ,)),
              );
            }),
      );

    }
    else if(state is SimilarBooksFailure){
      return CustomErrorWidget(errorMessage: state.errorMessage);
    }
    else {
      return CustomLoadingIndicator();
    }

  },
);
  }
}
