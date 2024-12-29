import 'package:get/get.dart';
import 'package:movieapp/features/search/data/datasource/remouteDataSource/api_endpoints.dart';
import 'package:movieapp/features/search/data/repoimp/search_repoim.dart';
import 'package:movieapp/features/search/domain/usecases/movie_name_usecase.dart';
import 'package:movieapp/features/search/presentation/manager/cubit/search_cubit.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    
    Get.lazyPut<SearchApiEndpoints>(() => SearchApiEndpoints());
    Get.lazyPut<SearchRepoim>(
        () => SearchRepoim(searchApiEndpoints: Get.find<SearchApiEndpoints>()));
    Get.lazyPut<MovieNameUsecase>(
        () => MovieNameUsecase(false,searchRepoim: Get.find<SearchRepoim>()),);
    Get.lazyPut<SearchCubit>(() => SearchCubit(Get.find<MovieNameUsecase>())..movieName(name: ""));
  }
  }

