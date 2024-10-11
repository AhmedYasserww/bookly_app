import 'package:bookly_app1/Core/utils/service_locator.dart';
import 'package:bookly_app1/Features/Auth/presentaition/views/sign_up_view.dart';
import 'package:bookly_app1/Features/Fanorite/presentation/views/favorite_view.dart';
import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:bookly_app1/Features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:bookly_app1/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app1/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app1/Features/onboring_screen/onBoarding_view.dart';
import 'package:bookly_app1/Features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly_app1/Features/home/data/repos/home_repo_implement.dart';
import '../../Features/Auth/presentaition/views/Log_in_view.dart';
import '../../Features/Splash/presentation/Views/splash_view.dart';

abstract class AppRouter{
  static const kHomeView = '/homeView';
  static const kBookDetailsView ='/bookDetailsView';
  static const kSearchView='/searchView';
  static const kFavoriteView='/favoriteView';
  static const kSignUpView='/signUpView';
  static const kLogInView='/logInView';
  static const kOnBoardingView='/onBoardingView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),

      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) =>  const SearchView(),

      ),
      GoRoute(
        path: kFavoriteView,
        builder: (context, state) =>  const FavoriteView(),

      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) =>  const SignUpView(),

      ),
      GoRoute(
        path: kLogInView,
        builder: (context, state) =>  const LogInView(),

      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) =>  const OnBoardingView(),

      )
    ],
  );
}
