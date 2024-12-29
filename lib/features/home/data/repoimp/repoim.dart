import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/data/datasource/remouteDataSource/api_endpoints.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/features/home/domain/repo/repo.dart';


class TopRatedMoviesHomeRepoIm extends TopRatedMoviesHomeRepo {
  final ApiEndpoints apiEndpoints;

  TopRatedMoviesHomeRepoIm({required this.apiEndpoints});
  @override
  Future<Either<String, List<MovieModel>>> TopRatedMovies() async {
    try {
      final response = await apiEndpoints.getTopRatedMovies();
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

class GeneresMoviesHomeRepoIm extends GeneresMoviesHomeRepo {
  final ApiEndpoints apiEndpoints;
  GeneresMoviesHomeRepoIm({required this.apiEndpoints});
  Future<Either<String, List<MovieModel>>> GenresMovies(
      {required String genres}) async {
    try {
      final response = await apiEndpoints.getGeneresMovies(genres: genres);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
