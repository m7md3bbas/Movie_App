


import 'package:get/get.dart';
import 'package:movieapp/Data/DataSource/HomeDataSource/RemouteDataSource/api_endpoints.dart';
import 'package:movieapp/Data/RepoImp/Home_repoimp.dart';
import 'package:movieapp/domain/UseCases/Home/genres_movies.dart';
import 'package:movieapp/domain/UseCases/Home/top_rated_movies.dart';
import 'package:movieapp/presentation/Home/manager/cubit/genric_cubit.dart';
import 'package:movieapp/presentation/Home/manager/cubit/home_cubit.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiEndPoints>(ApiEndPoints());
    Get.put<GeneresMoviesHomeRepoIm>(
        GeneresMoviesHomeRepoIm(apiEndpoints: Get.find<ApiEndPoints>()));

    Get.put<GenresMoviesUsecase>(GenresMoviesUsecase(
        generesMoviesHomeRepoIm: Get.find<GeneresMoviesHomeRepoIm>()));
    Get.put<TopRatedMoviesHomeRepoIm>(
        TopRatedMoviesHomeRepoIm(apiEndpoints: Get.find<ApiEndPoints>()));
    Get.put<TopRatedMoviesUseCase>(TopRatedMoviesUseCase(
        topRatedMoviesHomeRepoIm: Get.find<TopRatedMoviesHomeRepoIm>()));
    Get.lazyPut<HomeCubit>(() => HomeCubit(
        genresMoviesUsecase: Get.find<GenresMoviesUsecase>(),
        topRatedMoviesUseCase: Get.find<TopRatedMoviesUseCase>())
      ..topRatedMovies());
    Get.lazyPut<GenricCubit>(
        () => GenricCubit(Get.find<GenresMoviesUsecase>())..genresMovies(genres: "All"));
  }
}
