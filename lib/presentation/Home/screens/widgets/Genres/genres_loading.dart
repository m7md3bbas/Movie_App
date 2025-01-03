import 'package:flutter/material.dart';
import 'package:movieapp/core/widgets/custom_fading.dart';

class GenresLoadingWidget extends StatelessWidget {
  const GenresLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomFadingWidget(
              child: Container(
                  decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          )));
        });
  }
}
