import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';

part 'moviedetails_state.dart';

class MoviedetailsCubit extends Cubit<MoviedetailsState> {
  MoviedetailsCubit() : super(MoviedetailsInitial());

  final List<MovieEntity> favorites = [];
  Future<bool> addFavorite(MovieEntity movie) async {
    emit(MoviedetailsLoading());
    try {
      if (favorites.contains(movie)) return false;
      favorites.add(movie);
      emit(MoviedetailsAddedToFavorites(movie: movie));
      print(favorites.length);
      return true;
    } catch (e) {
      emit(MoviedetailsError(error: e.toString()));
      return false;
    }
  }

  Future<bool> removeFavorite(MovieEntity movie) async {
    emit(MoviedetailsLoading());
    try {
      if (!favorites.contains(movie)) return false;
      favorites.remove(movie);
      emit(MoviedetailsRemovedFromFavorites(movie: movie));
      print(favorites.length);
      return true;
    } catch (e) {
      emit(MoviedetailsError(error: e.toString()));
      return false;
    }
  }

  Future<void> getFavorites() async {
    emit(MoviedetailsLoading());
    try {
      emit(MoviedetailsLoadded(movies: favorites));
    } catch (e) {
      emit(MoviedetailsError(error: e.toString()));
    }
  }
}
