

import 'package:movieapp/Data/Models/movie_model.dart';
import 'package:movieapp/core/api/api_client.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';

class SearchApiEndPoints {
  static const String endpoint = 'list_movies.json';
  Future<List<MovieEntity>> movieName({required String movieName}) async {
    final response = await ApiClient().dio.get(endpoint);
    if (movieName.isEmpty) {
      return (response.data['data']['movies'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      try {
        if (response.statusCode == 200) {
          final List<MovieEntity> movies =
              (response.data['data']['movies'] as List)
                  .map((e) => MovieModel.fromJson(e))
                  .toList();

          return movies
              .where((movie) => movie.title.toLowerCase().contains(movieName))
              .toList();
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
