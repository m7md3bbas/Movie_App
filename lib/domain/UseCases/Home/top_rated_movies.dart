

import 'package:dartz/dartz.dart';
import 'package:movieapp/Data/RepoImp/Home_repoimp.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';

class TopRatedMoviesUseCase {
  final TopRatedMoviesHomeRepoIm topRatedMoviesHomeRepoIm;
  TopRatedMoviesUseCase({required this.topRatedMoviesHomeRepoIm});

  Future<Either<String, List<MovieEntity>>> call() async =>
      await topRatedMoviesHomeRepoIm.TopRatedMovies();
}
