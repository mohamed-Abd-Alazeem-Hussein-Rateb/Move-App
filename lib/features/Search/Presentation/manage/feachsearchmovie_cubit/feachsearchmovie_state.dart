part of 'feachsearchmovie_cubit.dart';

@immutable
sealed class FeachsearchmovieState {}

final class FeatchsearchmovieInitial extends FeachsearchmovieState {}

final class FeatchsearchmovieLoading extends FeachsearchmovieState {}

final class FeatchsearchmovieSuccess extends FeachsearchmovieState {

  final List<HomeMovieModle> movies;

  FeatchsearchmovieSuccess(this.movies);
}

final class FeatchsearchmovieError extends FeachsearchmovieState {

  final String message;

  FeatchsearchmovieError(this.message);
}
