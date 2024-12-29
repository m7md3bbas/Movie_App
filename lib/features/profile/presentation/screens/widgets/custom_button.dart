import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.text,
 
    this.onLongPress, this.color, this.onTap,
  });
  final IconData icon;
  final String text;
  final Color? color;
  final VoidCallback? onTap;

  
  final VoidCallback? onLongPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Colors.amberAccent,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent),
            ),
          ],
        ),
      ),
    );
  }
}
