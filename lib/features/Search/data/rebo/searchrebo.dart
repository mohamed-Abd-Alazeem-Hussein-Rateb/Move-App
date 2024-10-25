import 'package:dartz/dartz.dart';
import 'package:moveapp/core/errors/falieure.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';

abstract class SearchRebo {
  Future <Either<Falieur, List<HomeMovieModle>>> getSearchMove({required String query});
}