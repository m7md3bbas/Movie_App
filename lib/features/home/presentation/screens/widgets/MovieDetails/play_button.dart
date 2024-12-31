import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * 0.325,
      left: screenWidth * 0.41,
      child: Container(
        alignment: Alignment.center,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.play_circle_outlined,
            color: Colors.amberAccent,
            size: screenHeight * 0.1,
          ),
        ),
      ),
    );
  }
}
