import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/widgets/custom_fading.dart';

class TopRatedLoadingWidget extends StatelessWidget {
  const TopRatedLoadingWidget({super.key, required this.onPageChanged});

  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    List topMovies = [1, 2, 5, 4, 8, 5, 9, 6, 4, 5, 8, 4, 5, 4];
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          CustomFadingWidget(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            color: Colors.grey,
          )),
          // Background image
          Positioned.fill(
            child: CustomFadingWidget(
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          // Overlay gradient for better readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff121312).withOpacity(0.7),
                    Color(0xff121312).withOpacity(0.7),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          // Carousel slider
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomFadingWidget(
                    child: Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width * 0.6,
                )),
                CarouselSlider(
                  items: topMovies
                      .map(
                        (e) => CustomFadingWidget(
                            child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                             color: Colors.grey,
                          ),
                          height: MediaQuery.of(context).size.height * 0.3,
                         
                        )),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 0.5,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, _) => onPageChanged(index),
                  ),
                ),
                CustomFadingWidget(
                  child: Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
