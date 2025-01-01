

import 'package:dartz/dartz.dart';
import 'package:movieapp/data/datasource/SearchDataSource/remouteDataSource/api_endpoints.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';
import 'package:movieapp/domain/Repo/search_repo.dart';

class SearchRepoim extends SearchRepo {
  final SearchApiEndPoints searchApiEndpoints;

  SearchRepoim({required this.searchApiEndpoints});
  @override
  Future<Either<String, List<MovieEntity>>> moviename(
      {required String movieName}) async {
    try {
      final response = await searchApiEndpoints.movieName(movieName: movieName);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
