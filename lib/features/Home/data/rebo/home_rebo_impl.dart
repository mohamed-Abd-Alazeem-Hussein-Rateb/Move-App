import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moveapp/core/errors/falieure.dart';
import 'package:moveapp/features/Home/data/modle/cast_modle.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';
import 'package:moveapp/features/Home/data/rebo/home_rebo.dart';

class HomeReboImpl implements HomeRebo {
  final Dio dio;
  HomeReboImpl({required this.dio});
  @override
  Future<Either<Falieur, List<CastModle>>> getCast({required int id}) async {
    final url = 'https://api.themoviedb.org/3/movie/$id/credits?api_key=57320f11d5797394a1e833a4b0f858e7';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['cast'];
        List<CastModle> cast = [];
        for (var item in data) {
          cast.add(CastModle.fromJson(item));
        }
        // رجع الـ Right في حالة النجاح
        return right(cast);
      } else {
        // رجع Left في حالة حدوث خطأ غير متوقع
        return left(ServerError(message: 'Unexpected error occurred'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Falieur, List<HomeMovieModle>>> getPopularData() async{
      const String _baseUrl = 'https://api.themoviedb.org/3/movie/popular';
      const String _apiKey = '57320f11d5797394a1e833a4b0f858e7';

    try {
      final response = await dio.get('$_baseUrl?api_key=$_apiKey');
        //  print('response *********: ${response.data}');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        List<HomeMovieModle> movies = [];
        for (var item in data) {
          movies.add(HomeMovieModle.fromJson(item));
        }
        //  print('movies********* : $movies');
        // رجع الـ Right في حالة النجاح
        return right(movies);
      } else {
        // رجع Left في حالة حدوث خطأ غير متوقع
        return left(ServerError(message: 'Unexpected error occurred'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(message: e.toString()));
      }
    }

  }

  @override
  Future<Either<Falieur, List<HomeMovieModle>>> getTopRatedData()async {
    const String _baseUrl = 'https://api.themoviedb.org/3/movie/top_rated';
    const String _apiKey = '57320f11d5797394a1e833a4b0f858e7';
    try {
      final response = await dio.get('$_baseUrl?api_key=$_apiKey');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        List<HomeMovieModle> movies = [];
        for (var item in data) {
          movies.add(HomeMovieModle.fromJson(item));
        }

        // رجع الـ Right في حالة النجاح
        return right(movies);
      } else {
        // رجع Left في حالة حدوث خطأ غير متوقع
        return left(ServerError(message: 'Unexpected error occurred'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Falieur, List<HomeMovieModle>>> getTrendingData()async {
    const String _baseUrl = 'https://api.themoviedb.org/3/trending/movie/day';
    const String _apiKey = '57320f11d5797394a1e833a4b0f858e7';

    try {
      final response = await dio.get('$_baseUrl?api_key=$_apiKey');
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        List<HomeMovieModle> movies = [];
        for (var item in data) {
          movies.add(HomeMovieModle.fromJson(item));
        }
       
        // رجع الـ Right في حالة النجاح
        return right(movies);
      } else {
        // رجع Left في حالة حدوث خطأ غير متوقع
        return left(ServerError(message: 'Unexpected error occurred'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(message: e.toString()));
      }
    }
  }
}