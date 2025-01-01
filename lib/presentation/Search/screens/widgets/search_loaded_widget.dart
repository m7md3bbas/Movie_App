import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';
import 'package:movieapp/presentation/Home/screens/movie_details.dart';
import 'package:movieapp/presentation/Home/screens/widgets/Custom_movie_image.dart';

class SearchLoadedWidget extends StatelessWidget {
  const SearchLoadedWidget({
    super.key,
    required this.gotMovies,
  });
  final List<MovieEntity> gotMovies;

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
                  ontap: () {
                    Get.to(() => MovieDetails(
                          currentIndex: index,
                          movies: gotMovies,
                        ));
                  },
                  image: movie.orginalImage,
                  rating: movie.rating);
            },
          );
  }
}
