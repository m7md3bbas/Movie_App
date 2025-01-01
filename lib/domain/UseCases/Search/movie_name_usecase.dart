

import 'package:dartz/dartz.dart';
import 'package:movieapp/Data/RepoImp/search_repoimp.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';

class MovieNameUsecase {
  final SearchRepoim searchRepoim;
  MovieNameUsecase(searchRepoImp, {required this.searchRepoim});
  Future<Either<String, List<MovieEntity>>> call(
          {required String movieName}) async =>
      await searchRepoim.moviename(movieName: movieName);
}
