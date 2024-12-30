import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/data/repoimp/repoim.dart';
import 'package:movieapp/features/home/domain/entities/movie_entity.dart';

class TopRatedMoviesUseCase {
  final TopRatedMoviesHomeRepoIm topRatedMoviesHomeRepoIm;
  TopRatedMoviesUseCase({required this.topRatedMoviesHomeRepoIm});

  Future<Either<String, List<MovieEntity>>> call() async =>
      await topRatedMoviesHomeRepoIm.TopRatedMovies();
}
