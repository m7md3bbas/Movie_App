import 'package:flutter/widgets.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/Custom_movie_image.dart';

class SearchLoadedWidget extends StatelessWidget {
  const SearchLoadedWidget({
    super.key,
    required this.gotMovies,
  });
  final List<MovieModel> gotMovies;

  @override
  Widget build(BuildContext context) {
    return gotMovies.isEmpty
        ? Center(
            child: Container(
              child: Text("Not Found"),
            ),
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: gotMovies.length,
            itemBuilder: (context, index) {
              final movie = gotMovies[index];
              return CustomMovieImage(
                  image: movie.orginalImage, rating: movie.rating);
            },
          );
  }
}
