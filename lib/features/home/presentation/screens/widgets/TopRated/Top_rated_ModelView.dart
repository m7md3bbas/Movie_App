import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/TopRated/top_rated_loading_widget.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/TopRated/top_rated_loaded_widget.dart';

class TopRatedModelview extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;

  const TopRatedModelview({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: Get.find<HomeCubit>(),
      listener: (context, state) {
        if (state is TopRatedMoviesError) {
          GetSnacbars.ErrorSnackbar(state.error);
        }
      },
      builder: (context, state) {
        if (state is moviesLoaded) {
          final List<MovieModel> topMovies = state.movies;
          return SliverToBoxAdapter(
            child: TopRatedLoadedWidget(
              movies: topMovies,
              currentIndex: currentIndex,
              onPageChanged: onIndexChanged,
            ),
          );
        } else if (state is TopRatedMoviesLoading) {
          return TopRatedLoadingWidget(
            onPageChanged: onIndexChanged,
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}