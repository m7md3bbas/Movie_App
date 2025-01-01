
import 'package:dartz/dartz.dart';
import 'package:movieapp/Data/RepoImp/Home_repoimp.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';

class GenresMoviesUsecase {
  final GeneresMoviesHomeRepoIm generesMoviesHomeRepoIm;
  GenresMoviesUsecase({required this.generesMoviesHomeRepoIm});

  Future<Either<String, List<MovieEntity>>> call(
          {required String genres}) async =>
      await generesMoviesHomeRepoIm.GenresMovies(genres: genres);
}
