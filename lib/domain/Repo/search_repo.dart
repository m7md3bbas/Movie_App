

import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';

abstract class SearchRepo {
  Future<Either<String, List<MovieEntity>>> moviename(
      {required String movieName});
}
