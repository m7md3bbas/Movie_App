import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';
import 'package:movieapp/domain/UseCases/Home/genres_movies.dart';
import 'package:movieapp/domain/UseCases/Home/top_rated_movies.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      {required this.topRatedMoviesUseCase, required this.genresMoviesUsecase})
      : super(HomeInitial());
  final TopRatedMoviesUseCase topRatedMoviesUseCase;
  final GenresMoviesUsecase genresMoviesUsecase;

  Future<void> topRatedMovies() async {
    emit(TopRatedMoviesLoading());
    final result = await topRatedMoviesUseCase.call();
    result.fold((l) => emit(TopRatedMoviesError(error: l)),
        (r) => emit(moviesLoaded(r)));
  }

}
