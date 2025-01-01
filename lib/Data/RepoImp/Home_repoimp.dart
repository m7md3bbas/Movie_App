

import 'package:dartz/dartz.dart';
import 'package:movieapp/Data/DataSource/HomeDataSource/RemouteDataSource/api_endpoints.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';
import 'package:movieapp/domain/Repo/home_repo.dart';

class TopRatedMoviesHomeRepoIm extends TopRatedMoviesHomeRepo {
  final ApiEndPoints apiEndpoints;

  TopRatedMoviesHomeRepoIm({required this.apiEndpoints});
  @override
  Future<Either<String, List<MovieEntity>>> TopRatedMovies() async {
    try {
      final response = await apiEndpoints.getTopRatedMovies();
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

class GeneresMoviesHomeRepoIm extends GeneresMoviesHomeRepo {
  final ApiEndPoints apiEndpoints;
  GeneresMoviesHomeRepoIm({required this.apiEndpoints});
  Future<Either<String, List<MovieEntity>>> GenresMovies(
      {required String genres}) async {
    try {
      final response = await apiEndpoints.getGeneresMovies(genres: genres);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
