

import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';

abstract class TopRatedMoviesHomeRepo {
  Future<Either<String, List<MovieEntity>>> TopRatedMovies();
}

abstract class GeneresMoviesHomeRepo {
  Future<Either<String, List<MovieEntity>>> GenresMovies(
      {required String genres});
}
