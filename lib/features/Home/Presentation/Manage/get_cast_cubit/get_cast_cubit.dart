import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moveapp/features/Home/data/modle/cast_modle.dart';
import 'package:moveapp/features/Home/data/rebo/home_rebo.dart';

part 'get_cast_state.dart';

class GetCastCubit extends Cubit<GetCastState> {
  GetCastCubit(this.homeRebo) : super(GetCastInitial());
   final HomeRebo homeRebo;
  List<CastModle> cast = [];

  void getPepuleCast({required int id}) async {
    emit(GetCastLoading());
    final result = await homeRebo.getCast(id: id);
    result.fold((falieur) {
      emit(GetCastError(falieur.message));
    }
     , (cast) {
      cast = cast;
      emit(GetCastSuccess(cast));
    });
  }

}
