import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';


abstract class TopRatedMoviesHomeRepo {
  Future<Either<String, List<MovieModel>>> TopRatedMovies();
}

abstract class GeneresMoviesHomeRepo {
  Future<Either<String, List<MovieModel>>> GenresMovies(
      {required String genres});
}
