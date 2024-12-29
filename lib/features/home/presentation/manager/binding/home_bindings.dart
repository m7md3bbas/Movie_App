import 'package:get/get.dart';
import 'package:movieapp/features/home/data/datasource/remouteDataSource/api_endpoints.dart';
import 'package:movieapp/features/home/data/repoimp/repoim.dart';
import 'package:movieapp/features/home/domain/usecases/genres_movies.dart';
import 'package:movieapp/features/home/domain/usecases/top_rated_movies.dart';
import 'package:movieapp/features/home/presentation/manager/cubit/genric_cubit.dart';
import 'package:movieapp/features/home/presentation/manager/cubit/home_cubit.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiEndpoints>(ApiEndpoints());
    Get.put<GeneresMoviesHomeRepoIm>(
        GeneresMoviesHomeRepoIm(apiEndpoints: Get.find<ApiEndpoints>()));

    Get.put<GenresMoviesUsecase>(GenresMoviesUsecase(
        generesMoviesHomeRepoIm: Get.find<GeneresMoviesHomeRepoIm>()));
    Get.put<TopRatedMoviesHomeRepoIm>(
        TopRatedMoviesHomeRepoIm(apiEndpoints: Get.find<ApiEndpoints>()));
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
