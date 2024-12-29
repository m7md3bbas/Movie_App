
class MovieModel {
  final num id;
  final String url;
  final String title;
  final num year;
  final num rating;
  final List<String> genres;
  final String lan;
  final String background;
  final String orginalImage;
  MovieModel(this.id, this.url, this.title, this.year, this.rating, this.genres,
      this.lan, this.background, this.orginalImage);
  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as num,
        url = json['url'] as String,
        title = json['title'] as String,
        year = json['year'] as num,
        rating = json['rating'] as num,
        genres = List<String>.from(json['genres']),
        lan = json['language'] as String,
        background = json['background_image'] as String,
        orginalImage = json['medium_cover_image'] as String;
}
