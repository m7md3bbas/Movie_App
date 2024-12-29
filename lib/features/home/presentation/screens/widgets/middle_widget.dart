import 'package:flutter/material.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/dropdown_widget.dart';

class middleWidget extends StatelessWidget {
  const middleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Movies',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            DropdownWidget(),
          ],
        ),
      ),
    );
  }
}
