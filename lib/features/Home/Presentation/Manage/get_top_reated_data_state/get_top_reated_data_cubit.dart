import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';
import 'package:moveapp/features/Home/data/rebo/home_rebo.dart';

part 'get_top_reated_data_state.dart';

class GetTopReatedDataCubit extends Cubit<GetTopReatedDataState> {
  GetTopReatedDataCubit(this.homeRebo) : super(GetTopReatedDataInitial());
  final HomeRebo homeRebo;
  List<HomeMovieModle> topRated = [];

  Future<void> getTopRatedData() async {
    emit(GetTopReatedDataLoading());
    final result = await homeRebo.getTopRatedData();
    result.fold((falieur) {
      emit(GetTopReatedDataError(falieur.message));
       
      }
    , (movies) {
      topRated = movies;
      emit(GetTopReatedDataSuccess(movies));
    }
    );
  }
}
