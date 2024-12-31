import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    required this.context,
    required this.screenHeight,
  });

  final BuildContext context;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
        iconSize: screenHeight * 0.05,
        color: Colors.amberAccent,
      ),
    );
  }}