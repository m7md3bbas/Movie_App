class MovieEntity {
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

  MovieEntity(
      {required this.id,
      required this.url,
      required this.title,
      required this.runtime,
      required this.year,
      required this.rating,
      required this.genres,
      required this.lan,
      required this.background,
      required this.orginalImage});
}
