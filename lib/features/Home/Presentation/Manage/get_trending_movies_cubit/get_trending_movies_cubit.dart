import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';
import 'package:moveapp/features/Home/data/rebo/home_rebo.dart';

part 'get_trending_movies_state.dart';

class GetTrendingMoviesCubit extends Cubit<GetTrendingMoviesState> {
  GetTrendingMoviesCubit(this.homeRebo) : super(GetTrendingMoviesInitial());
 final HomeRebo homeRebo;
  List<HomeMovieModle> movies = [];

  Future<void> getTrendingMovies() async {
    emit(GetTrendingMoviesLoading());
    final result = await homeRebo.getTrendingData();
    result.fold((falier) {
      emit(GetTrendingMoviesError(falier.message));
    }, (movies) {
      this.movies = movies;
      emit(GetTrendingMoviesSuccess(movies));
    });
  }
}
