import 'package:movieapp/features/home/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final num id;
  final String url;
  final String title;
  final num runtime;
  final num year;
  final num rating;
  final List<dynamic> genres;
  final String lan;
  final String background;
  final String orginalImage;
  MovieModel(
      {required this.id,
      required this.url,
      required this.title,
      required this.year,
      required this.rating,
      required this.genres,
      required this.lan,
      required this.background,
      required this.orginalImage,
      required this.runtime})
      : super(
            id: id,
            url: url,
            title: title,
            runtime: runtime,
            year: year,
            rating: rating,
            genres: genres,
            lan: lan,
            background: background,
            orginalImage: orginalImage);
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'] as num,
        url: json['url'] as String,
        title: json['title'] as String,
        year: json['year'] as num,
        rating: json['rating'] as num,
        genres: json['genres'] as List<dynamic>,
        lan: json['language'] as String,
        background: json['background_image_original'] as String,
        orginalImage: json['medium_cover_image'] as String,
        runtime: json['runtime'] as num);
  }
}
