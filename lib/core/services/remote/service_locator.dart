import 'package:get_it/get_it.dart';
import 'package:royal_home/core/services/remote/api_service.dart';
import 'package:royal_home/features/auth/cubit/auth_cubit.dart';
import 'package:royal_home/features/auth/data/auth_repository.dart';
import 'package:royal_home/features/home/categories/cubit/categories_cubit.dart';
import 'package:royal_home/features/home/categories/data/categories_repository.dart';
import 'package:royal_home/features/home/products/cubit/products_cubit.dart';
import 'package:royal_home/features/home/products/data/products_repository.dart';

final GetIt locator = GetIt.instance;

void setupServiceLocator() {
  //ApiService
  locator.registerLazySingleton<ApiService>(() => ApiService());

  //Repositorys
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepository(locator<ApiService>()));
  locator.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepository(locator<ApiService>()));
  locator.registerLazySingleton<ProductsRepository>(
      () => ProductsRepository(locator<ApiService>()));
  //Cubit
  locator.registerLazySingleton<AuthCubit>(
      () => AuthCubit(locator<AuthRepository>()));
  locator.registerLazySingleton<CategoriesCubit>(
      () => CategoriesCubit(locator<CategoriesRepository>()));
  locator.registerLazySingleton<ProductsCubit>(
      () => ProductsCubit(locator<ProductsRepository>()));
}
