part of 'genric_cubit.dart';

@immutable
sealed class GenricState {}

final class GenricInitial extends GenricState {}

final class GenresLoading extends GenricState {}

final class GenresLoaded extends GenricState {
  final List<MovieEntity> movies;
  GenresLoaded({required this.movies});
}

final class GenresError extends GenricState {
  final String message;
  GenresError({required this.message});
}
final class Genre extends GenricState {
  final String message;
  Genre({required this.message});
}