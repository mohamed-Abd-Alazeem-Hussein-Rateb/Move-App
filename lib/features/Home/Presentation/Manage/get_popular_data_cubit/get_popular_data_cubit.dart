import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';
import 'package:moveapp/features/Home/data/rebo/home_rebo.dart';

part 'get_popular_data_state.dart';

class GetPopularDataCubit extends Cubit<GetPopularDataState> {
  GetPopularDataCubit(this.homeRebo) : super(GetPopularDataInitial());
  final HomeRebo homeRebo;
  List<HomeMovieModle> movies = [];

  Future<void> getPopularData() async {
    emit(GetPopularDataLoading());
    final result = await homeRebo.getPopularData();
    result.fold((falier) {
      emit(GetPopularDataError(falier.message));
    }, (movies) {
      this.movies = movies;
      emit(GetPopularDataLoaded(movies));
    });
  }
}
