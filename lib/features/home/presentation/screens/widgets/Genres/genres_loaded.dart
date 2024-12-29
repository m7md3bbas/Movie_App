
import 'package:flutter/material.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/Custom_movie_image.dart';

class GenresLoadedWidget extends StatelessWidget {
  const GenresLoadedWidget({
    super.key,
    required this.generalMovies,
  });

  final List<MovieModel> generalMovies;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: generalMovies.length,
        itemBuilder: (context, index) {
          return CustomMovieImage(
              image: generalMovies[index].orginalImage,
              rating: generalMovies[index].rating);
        });
  }
}
