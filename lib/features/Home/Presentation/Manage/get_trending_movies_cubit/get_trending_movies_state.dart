part of 'get_trending_movies_cubit.dart';

@immutable
sealed class GetTrendingMoviesState {}

final class GetTrendingMoviesInitial extends GetTrendingMoviesState {}

final class GetTrendingMoviesLoading extends GetTrendingMoviesState {}

final class GetTrendingMoviesSuccess extends GetTrendingMoviesState {
  final List<HomeMovieModle> movies;
  GetTrendingMoviesSuccess( this.movies);
}

final class GetTrendingMoviesError extends GetTrendingMoviesState {
  final String message;
  GetTrendingMoviesError(this.message);
}
