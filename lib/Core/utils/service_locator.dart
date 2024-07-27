import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:bookly_app1/Core/utils/api_service.dart';
import 'package:bookly_app1/Features/home/data/repos/home_repo_implement.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(apiService:getIt.get<ApiService>(),
  ));

}

