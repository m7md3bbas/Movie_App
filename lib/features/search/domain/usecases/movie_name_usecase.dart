import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/features/search/data/repoimp/search_repoim.dart';

class MovieNameUsecase {
  final SearchRepoim searchRepoim;
  MovieNameUsecase(searchRepoImp, {required this.searchRepoim});
  Future<Either<String, List<MovieModel>>> call(
          {required String movieName}) async =>
      await searchRepoim.moviename(movieName: movieName);
}
