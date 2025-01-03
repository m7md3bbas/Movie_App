

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';
import 'package:movieapp/presentation/Home/manager/cubit/genric_cubit.dart';
import 'package:movieapp/presentation/Home/screens/widgets/Genres/genres_loaded.dart';
import 'package:movieapp/presentation/Home/screens/widgets/Genres/genres_loading.dart';

class GenreModelView extends StatelessWidget {
  const GenreModelView({super.key, });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenricCubit, GenricState>(
      bloc: Get.find<GenricCubit>(),
      listener: (context, state) {
        if (state is GenresError) {
          GetSnacbars.ErrorSnackbar(state.message);
        }
      },
      builder: (context, state) {
        if (state is GenresLoaded) {
          return GenresLoadedWidget(
            genresMovies: state.movies,
           
          );
        } else if (state is GenresLoading) {
          return const GenresLoadingWidget();
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
