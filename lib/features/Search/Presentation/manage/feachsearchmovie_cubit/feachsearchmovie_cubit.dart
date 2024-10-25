import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';
import 'package:moveapp/features/Search/data/rebo/searchrebo.dart';
part 'feachsearchmovie_state.dart';

class FeatchSearchMovieCubit extends Cubit<FeachsearchmovieState> {
  FeatchSearchMovieCubit(this.searchRebo) : super(FeatchsearchmovieInitial());
  final SearchRebo searchRebo;
  List<HomeMovieModle> movies = [];

  Future<void> getSearchMove({required String query}) async {
    emit(FeatchsearchmovieLoading());
    final result = await searchRebo.getSearchMove(query: query);
    result.fold((failure) {
  emit(FeatchsearchmovieError(failure.message));
}, (movies) {
  this.movies = movies;
  emit(FeatchsearchmovieSuccess(movies));
   });
  }
}
