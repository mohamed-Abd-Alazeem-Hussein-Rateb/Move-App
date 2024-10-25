import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';

part 'witch_list_state.dart';

class WitchListCubit extends Cubit<WitchListState> {
  WitchListCubit() : super(WitchListInitial());
  List <HomeMovieModle> witchList = [];
  
    void toggleWitchList(HomeMovieModle movie) {
    if(witchList.contains(movie)) {
      witchList.remove(movie);
      
    } else {
      witchList.add(movie);
    }
    emit(WitchListsuccess(witchList));
  }
}
