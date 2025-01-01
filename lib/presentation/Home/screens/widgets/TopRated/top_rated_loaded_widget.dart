import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';
import 'package:movieapp/presentation/Home/screens/movie_details.dart';
import 'package:movieapp/presentation/Home/screens/widgets/Custom_movie_image.dart';
import 'background_widget.dart';

class TopRatedLoadedWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const TopRatedLoadedWidget({
    super.key,
    required this.movies,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundWidget(imageUrl: movies[currentIndex].orginalImage),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 50,
          children: [
            Image.asset(
              'assets/images/Available Now.png',
              color: Colors.amber,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            CarouselSlider(
              items: movies
                  .map(
                    (e) => CustomMovieImage(
                      ontap: () {
                        Get.to(() => MovieDetails(
                          currentIndex: currentIndex,
                              movies: movies,
                            ));
                      },
                      image: e.orginalImage,
                      rating: e.rating,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 300,
                autoPlay: false,
                viewportFraction: 0.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                onPageChanged: (index, _) => onPageChanged(index),
              ),
            ),
            Image.asset('assets/images/Watch Now.png',
                width: MediaQuery.of(context).size.width * 0.7,
                color: Colors.amber),
          ],
        ),
      ],
    );
  }
}
