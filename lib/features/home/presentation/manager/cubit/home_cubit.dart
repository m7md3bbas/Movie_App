import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/features/home/domain/entities/movie_entity.dart';
import 'package:movieapp/features/home/domain/usecases/genres_movies.dart';
import 'package:movieapp/features/home/domain/usecases/top_rated_movies.dart';
import 'package:movieapp/features/home/presentation/screens/movie_details.dart';

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
