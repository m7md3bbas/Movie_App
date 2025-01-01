
import 'package:flutter/material.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({
    super.key,
    required this.rating,
  });

  final num rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        spacing: 10,
        children: [
          Text(
            rating.toString(),
            style: TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
