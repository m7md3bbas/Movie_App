import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    this.color,
    this.onTap,  this.width,
  });
  final IconData? icon;
  final String text;
  final Color? color;
  final VoidCallback? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: color),
        child: Text(
          text,
          style: TextStyle(color: Colors.amberAccent),
        ),
      ),
    );
  }
}
