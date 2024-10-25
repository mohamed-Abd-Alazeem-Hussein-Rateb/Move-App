import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moveapp/core/errors/falieure.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';
import 'package:moveapp/features/Search/data/rebo/searchrebo.dart';

class SearchReboImpl implements SearchRebo {
  final Dio dio;
  SearchReboImpl({required this.dio});

  @override
  Future<Either<Falieur, List<HomeMovieModle>>> getSearchMove({required String query}) async {
    const String _baseUrl = 'https://api.themoviedb.org/3';
    const String _apiKey = '57320f11d5797394a1e833a4b0f858e7';

    try {
      final response = await dio.get('$_baseUrl/search/movie?api_key=$_apiKey&query=$query');
      
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
