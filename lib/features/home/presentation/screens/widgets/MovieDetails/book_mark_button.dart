
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookMarkButton extends StatelessWidget {
  const BookMarkButton({
    super.key,
    required this.currentTap,
    required this.screenHeight,
  });

  final ValueNotifier<bool> currentTap;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: ValueListenableBuilder(
        valueListenable: currentTap,
        builder: (context, value, child) => IconButton(
          icon: value
              ? Icon(
                  Icons.bookmark_add,
                  color: Colors.amberAccent,
                  size: screenHeight * 0.058,
                )
              : Icon(
                  Icons.bookmark_add,
                  size: screenHeight * 0.055,
                ),
          onPressed: () => currentTap.value = !currentTap.value,
        ),
      ),
    );
  }
}