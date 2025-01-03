part of 'moviedetails_cubit.dart';

@immutable
sealed class MoviedetailsState {}

final class MoviedetailsInitial extends MoviedetailsState {}

final class MoviedetailsLoading extends MoviedetailsState {}

final class MoviedetailsLoadded extends MoviedetailsState {
  final List<MovieEntity> movies;
  MoviedetailsLoadded({required this.movies});
}

final class MoviedetailsAddedToFavorites extends MoviedetailsState {
  final MovieEntity movie;
  MoviedetailsAddedToFavorites({required this.movie});
}

final class MoviedetailsRemovedFromFavorites extends MoviedetailsState {
  final MovieEntity movie;
  MoviedetailsRemovedFromFavorites({required this.movie});
}

final class MoviedetailsError extends MoviedetailsState {
  final String error;
  MoviedetailsError({required this.error});
}
