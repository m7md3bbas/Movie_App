import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/features/home/data/repoimp/repoim.dart';

class GenresMoviesUsecase {
  final GeneresMoviesHomeRepoIm generesMoviesHomeRepoIm;
  GenresMoviesUsecase({required this.generesMoviesHomeRepoIm});

  Future<Either<String, List<MovieModel>>> call(
          {required String genres}) async =>
      await generesMoviesHomeRepoIm.GenresMovies(genres: genres);
}
