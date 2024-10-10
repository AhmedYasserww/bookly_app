import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app1/Core/utils/app_router.dart';
import 'package:bookly_app1/Core/utils/service_locator.dart';
import 'package:bookly_app1/Features/home/data/repos/home_repo_implement.dart';
import 'package:bookly_app1/Features/home/presentation/manager/featured/featured_books_cubit.dart';
import 'package:bookly_app1/Features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:bookly_app1/constants.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the category here
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImplementation>())..fetchNewestBooks(),
        ),

      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
