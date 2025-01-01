import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';
import 'package:movieapp/domain/UseCases/Search/movie_name_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.movieNameUsecase) : super(SearchInitial());
  final MovieNameUsecase movieNameUsecase;
  Future<void> movieName({required String name}) async {
    emit(SearchLoading());
    final result = await movieNameUsecase.call(movieName: name);
    result.fold((l) => emit(Searcherror(message: l)),
        (r) => emit(SearchLoaded(movies: r)));
  }
}
