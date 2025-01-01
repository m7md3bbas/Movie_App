import 'package:get/get.dart';
import 'package:movieapp/Data/RepoImp/search_repoimp.dart';
import 'package:movieapp/data/datasource/SearchDataSource/remouteDataSource/api_endpoints.dart';
import 'package:movieapp/domain/UseCases/Search/movie_name_usecase.dart';
import 'package:movieapp/presentation/Search/manager/cubit/search_cubit.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchApiEndPoints>(() => SearchApiEndPoints());
    Get.lazyPut<SearchRepoim>(
        () => SearchRepoim(searchApiEndpoints:Get.find<SearchApiEndPoints>()));
    Get.lazyPut<MovieNameUsecase>(
      () => MovieNameUsecase(false, searchRepoim: Get.find<SearchRepoim>()),
    );
    Get.lazyPut<SearchCubit>(() => SearchCubit(Get.find<MovieNameUsecase>())..movieName(name: 
    ""));
  }
}
