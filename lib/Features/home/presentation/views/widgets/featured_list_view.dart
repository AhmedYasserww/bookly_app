import 'package:bookly_app1/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app1/Features/home/presentation/manager/featured/featured_books_cubit.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_widget_error.dart';
import 'package:go_router/go_router.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksLoading) {
          return const CustomLoadingIndicator();
        } else if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.29,
            child: ListView.builder(
              physics:const  BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,extra:state.books[i]);
                    },
                      child: CustomBookItem(imageUrl: state.books[i].volumeInfo.imageLinks?.thumbnail ?? "")), // تأكد من أنه يتم استخدام الصورة الصغيرة للكتاب
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator(); // يمكنك استبدالها بعرض خطأ أو حالة أخرى حسب التصميم المطلوب
        }
      },
    );
  }
}
