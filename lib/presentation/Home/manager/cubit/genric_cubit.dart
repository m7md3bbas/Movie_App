import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';
import 'package:movieapp/domain/UseCases/Home/genres_movies.dart';

part 'genric_state.dart';

class GenricCubit extends Cubit<GenricState> {
  GenricCubit(this.genresMoviesUsecase) : super(GenricInitial());
  final GenresMoviesUsecase genresMoviesUsecase;

  Future<void> genresMovies({required String genres}) async {
    emit(GenresLoading());
    final result = await genresMoviesUsecase.call(genres: genres);
    result.fold((l) => emit(GenresError(message: l)),
        (r) => emit(GenresLoaded(movies: r)));
  }

  void selectGenre(dynamic genre) {
    emit(Genre(message: genre));
  }
}
