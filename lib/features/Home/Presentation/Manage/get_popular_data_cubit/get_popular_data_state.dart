part of 'get_popular_data_cubit.dart';

@immutable
sealed class GetPopularDataState {}

final class GetPopularDataInitial extends GetPopularDataState {}

final class GetPopularDataLoading extends GetPopularDataState {}

final class GetPopularDataLoaded extends GetPopularDataState {
  final List<HomeMovieModle> movies;
  GetPopularDataLoaded(this.movies);
}

final class GetPopularDataError extends GetPopularDataState {
  final String message;
  GetPopularDataError(this.message);
}
