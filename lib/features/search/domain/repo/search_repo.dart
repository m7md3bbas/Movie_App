import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';

abstract class SearchRepo {
  Future<Either<String, List<MovieModel>>> moviename(
      {required String movieName});
}
