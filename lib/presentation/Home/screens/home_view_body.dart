import 'package:flutter/material.dart';
import 'package:movieapp/presentation/Home/screens/widgets/Genres/genre_model_view.dart';
import 'package:movieapp/presentation/Home/screens/widgets/TopRated/Top_rated_ModelView.dart';
import 'package:movieapp/presentation/Home/screens/widgets/middle_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody(
      {super.key, required this.currentIndex, required this.onIndexChanged});
  final int currentIndex;
  final void Function(int) onIndexChanged;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          TopRatedModelview(
              currentIndex: currentIndex, onIndexChanged: onIndexChanged),
          middleWidget(),
          const GenreModelView(),
        ],
      ),
    );
  }
}
