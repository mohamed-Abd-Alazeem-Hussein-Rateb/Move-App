import 'package:dartz/dartz.dart';
import 'package:moveapp/core/errors/falieure.dart';
import 'package:moveapp/features/Home/data/modle/cast_modle.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';

abstract class HomeRebo {
  Future <Either<Falieur, List<HomeMovieModle>>> getTrendingData();
  Future <Either<Falieur, List<HomeMovieModle>>> getPopularData();
  Future <Either<Falieur, List<HomeMovieModle>>> getTopRatedData();
  Future <Either<Falieur, List<CastModle>>> getCast({required int id});
}