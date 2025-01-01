import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapp/presentation/Home/screens/movie_details.dart';

class YearTextWidget extends StatelessWidget {
  const YearTextWidget({
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
      bottom: screenHeight * 0.325 / 4,
      left: screenWidth * 0.41,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          widget.movies[widget.currentIndex].year.toString(),
          style: TextStyle(
            fontSize: screenHeight * 0.05,
            fontWeight: FontWeight.normal,
            color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}