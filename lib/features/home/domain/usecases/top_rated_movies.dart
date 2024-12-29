import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/features/home/data/repoimp/repoim.dart';

class TopRatedMoviesUseCase {
  final TopRatedMoviesHomeRepoIm topRatedMoviesHomeRepoIm;
  TopRatedMoviesUseCase({required this.topRatedMoviesHomeRepoIm});

  Future<Either<String, List<MovieModel>>> call() async =>
      await topRatedMoviesHomeRepoIm.TopRatedMovies();
}
