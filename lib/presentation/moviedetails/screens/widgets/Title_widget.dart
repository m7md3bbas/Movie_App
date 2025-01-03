import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapp/presentation/moviedetails/screens/movie_details.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.widget,
    required this.context,
    required this.screenHeight,
    required this.screenWidth,
  });

  final MovieDetails widget;
  final BuildContext context;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * 0.325 / 2,
      left: screenWidth * 0.10,
      right: screenWidth * 0.10,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          widget.movies[widget.currentIndex].title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}
