part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class homeLoading extends HomeState {}

final class homeLoaded extends HomeState {}

final class homeError extends HomeState {
  final String message;
  homeError({required this.message});
}


final class TopRatedMoviesLoading extends HomeState {}

final class moviesLoaded extends HomeState {
  final List<MovieEntity> movies;
  moviesLoaded(this.movies);
}

final class genresmoviesLoaded extends HomeState {
  final List<MovieEntity> movies;
  genresmoviesLoaded(this.movies);
}

final class TopRatedMoviesError extends HomeState {
  final String error;
  TopRatedMoviesError({required this.error});
}

