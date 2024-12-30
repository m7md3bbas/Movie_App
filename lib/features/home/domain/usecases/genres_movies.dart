import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/data/repoimp/repoim.dart';
import 'package:movieapp/features/home/domain/entities/movie_entity.dart';

class GenresMoviesUsecase {
  final GeneresMoviesHomeRepoIm generesMoviesHomeRepoIm;
  GenresMoviesUsecase({required this.generesMoviesHomeRepoIm});

  Future<Either<String, List<MovieEntity>>> call(
          {required String genres}) async =>
      await generesMoviesHomeRepoIm.GenresMovies(genres: genres);
}
