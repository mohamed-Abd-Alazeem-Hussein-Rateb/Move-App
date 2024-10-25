part of 'get_top_reated_data_cubit.dart';

@immutable
sealed class GetTopReatedDataState {}

final class GetTopReatedDataInitial extends GetTopReatedDataState {}

final class GetTopReatedDataLoading extends GetTopReatedDataState {}

final class GetTopReatedDataSuccess extends GetTopReatedDataState {
  final List<HomeMovieModle> movies;  

  GetTopReatedDataSuccess(this.movies);
}

final class GetTopReatedDataError extends GetTopReatedDataState {
  final String message; 

  GetTopReatedDataError(this.message);
}
