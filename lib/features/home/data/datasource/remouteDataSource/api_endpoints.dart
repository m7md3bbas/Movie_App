import 'package:movieapp/core/api/api_client.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/features/home/domain/entities/movie_entity.dart';

class ApiEndpoints {
  static const String endpoint = 'list_movies.json';
  Future<List<MovieEntity>> getTopRatedMovies() async {
    try {
      final response = await ApiClient().dio.get(endpoint);

      if (response.statusCode == 200) {
        final List<MovieEntity> movies =
            (response.data['data']['movies'] as List)
                .map((e) => MovieModel.fromJson(e))
                .toList();

        final topRatedMovies =
            movies.where((movie) => movie.rating >= 5).toList();

        return topRatedMovies;
      } else {
        throw Exception('Failed to fetch movies');
      }
    } catch (e) {
      print('Error fetching top-rated movies: $e');
      return [];
    }
  }

  Future<List<MovieEntity>> getGeneresMovies({required String genres}) async {
    final response = await ApiClient().dio.get(endpoint);
    if (genres == "All") {
      return (response.data['data']['movies'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      try {
        if (response.statusCode == 200) {
          final List<MovieEntity> genresList =
              (response.data['data']['movies'] as List)
                  .map((e) => MovieModel.fromJson(e))
                  .toList();

          // Filter movies by genre
          final genresMovies = genresList
              .where((movie) => movie.genres.contains(genres))
              .toList();

          print(genresMovies.length);
          return genresMovies;
        } else {
          throw Exception('Failed to fetch movies');
        }
      } catch (e) {
        print('Error fetching movies by genre: $e');
        return [];
      }
    }
  }
}
