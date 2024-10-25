part of 'witch_list_cubit.dart';

@immutable
sealed class WitchListState {}

final class WitchListInitial extends WitchListState {}

final class WitchListsuccess extends WitchListState {

  final List <HomeMovieModle> witchList;
  WitchListsuccess(this.witchList);
}
