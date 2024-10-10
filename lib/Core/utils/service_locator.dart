import 'package:bookly_app1/Features/search/data/repo/search_repo_imp.dart';
import 'package:bookly_app1/Features/search/presentation/manager/search_for_book_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:bookly_app1/Core/utils/api_service.dart';
import 'package:bookly_app1/Features/home/data/repos/home_repo_implement.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(apiService:getIt.get<ApiService>(),

  ));
  getIt.registerSingleton<SearchRepoImp>(SearchRepoImp(apiService: getIt.get<ApiService>()));
  getIt.registerFactory<SearchForBookCubit>(()=>SearchForBookCubit(getIt<SearchRepoImp>(), ""));

      }

