import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';
import 'package:movieapp/presentation/moviedetails/manager/cubit/moviedetails_cubit.dart';

class BookMarkButton extends StatelessWidget {
  const BookMarkButton({
    super.key,
    required this.screenHeight,
    required this.movies,
    required this.currentIndex,
  });

  final List<MovieEntity> movies;
  final int currentIndex;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    final cubit = Get.find<MoviedetailsCubit>();

    return Positioned(
      top: 10,
      right: 10,
      child: BlocBuilder<MoviedetailsCubit, MoviedetailsState>(
        bloc: cubit,
        builder: (context, state) {
          final isFavorited = cubit.favorites.contains(movies[currentIndex]);

          return IconButton(
            icon: Icon(
              isFavorited ? Icons.bookmark_added : Icons.bookmark_add,
              color: isFavorited ? Colors.amberAccent : Colors.grey,
              size: screenHeight * 0.055,
            ),
            onPressed: () async {
              if (isFavorited) {
                await cubit.removeFavorite(movies[currentIndex]);
              } else {
                await cubit.addFavorite(movies[currentIndex]);
              }
            },
          );
        },
      ),
    );
  }
}
