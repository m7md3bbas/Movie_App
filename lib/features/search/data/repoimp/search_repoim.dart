import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/features/search/data/datasource/remouteDataSource/api_endpoints.dart';
import 'package:movieapp/features/search/domain/repo/search_repo.dart';

class SearchRepoim extends SearchRepo {
  final SearchApiEndpoints searchApiEndpoints;

  SearchRepoim({required this.searchApiEndpoints});
  @override
  Future<Either<String, List<MovieModel>>> moviename(
      {required String movieName}) async {
    try {
      final response = await searchApiEndpoints.movieName(movieName: movieName);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
