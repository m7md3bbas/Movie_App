part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<MovieModel> movies;

  SearchLoaded({required this.movies});
}

final class Searcherror extends SearchState {
  final String message;

  Searcherror({required this.message});
}
