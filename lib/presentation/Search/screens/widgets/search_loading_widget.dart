
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapp/core/widgets/custom_fading.dart';

class SearchLoadingWidget extends StatelessWidget {
  const SearchLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey,
            ),
          ));
        });
  }
}