import 'package:flutter/material.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/top_rated_widget.dart';

class CustomMovieImage extends StatelessWidget {
  const CustomMovieImage(
      {super.key,
      required this.image,
      required this.rating,
      required this.ontap});
  final String image;
  final num rating;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(children: [
            Image.network(
              image,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: TopRatedWidget(rating: rating),
            )
          ]),
        ),
      ),
    );
  }
}
