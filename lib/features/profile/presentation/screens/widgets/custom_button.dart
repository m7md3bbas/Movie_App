import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onTap,
      this.onLongPress,
      this.color});
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final Color? color;

  final VoidCallback? onLongPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
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
