import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapp/core/widgets/custom_button.dart';
import 'package:movieapp/features/home/domain/entities/movie_entity.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/Custom_movie_image.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/MovieDetails/Title_widget.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/MovieDetails/back_button.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/MovieDetails/book_mark_button.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/MovieDetails/play_button.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/MovieDetails/year_widget.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.movies,
    required this.currentIndex,
  });

  final List<MovieEntity> movies;
  final int currentIndex;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late List<MovieEntity> similarMovie;
  late List<MovieEntity> mainMovie;
  final ValueNotifier<bool> currentTap = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _filterMovies();
  }

  void _filterMovies() {
    final Set<dynamic> targetGenres =
        widget.movies[widget.currentIndex].genres.toSet();

    final List<MovieEntity> movieList = widget.movies
        .where((movie) =>
            movie.genres.any((genre) => targetGenres.contains(genre)))
        .toList();

    similarMovie = movieList
        .where((movie) => movie.id != widget.movies[widget.currentIndex].id)
        .toList();
    mainMovie = movieList
        .where((movie) => movie.id == widget.movies[widget.currentIndex].id)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: mainMovie.isNotEmpty
                                ? NetworkImage(mainMovie[0].orginalImage)
                                : const AssetImage('assets/images/error.png')
                                    as ImageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.secondary,
                                const Color(0xff121312).withOpacity(0.2),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      BackButtonWidget(
                        context: context,
                        screenHeight: screenHeight,
                      ),
                      PlayButtonWidget(
                          screenHeight: screenHeight, screenWidth: screenWidth),
                      BookMarkButton(
                          currentTap: currentTap, screenHeight: screenHeight),
                      TitleTextWidget(
                          widget: widget,
                          context: context,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth),
                      YearTextWidget(
                          widget: widget,
                          context: context,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth),
                    ],
                  ),
                  CustomButton(
                    width: screenWidth * 0.9,
                    isIcon: false,
                    text: "Watch Now",
                    color: Theme.of(context).colorScheme.secondary,
                    onTap: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: widget.movies[widget.currentIndex].runtime
                            .toString(),
                        isIcon: true,
                        icon: Icons.hourglass_bottom,
                      ),
                      CustomButton(
                        text: widget.movies[widget.currentIndex].rating
                            .toString(),
                        isIcon: true,
                        icon: Icons.star,
                      ),
                      CustomButton(
                        text: widget.movies[widget.currentIndex].lan.toString(),
                        isIcon: true,
                        icon: Icons.language,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Similar Movies",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
            similarMovie.isEmpty
                ? SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "No Similar Movies",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ),
                  )
                : SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: similarMovie.length,
                    itemBuilder: (context, index) {
                      return CustomMovieImage(
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                currentIndex:
                                    widget.movies.indexOf(similarMovie[index]),
                                movies: widget.movies,
                              ),
                            ),
                          );
                        },
                        image: similarMovie[index].orginalImage,
                        rating: similarMovie[index].rating,
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
