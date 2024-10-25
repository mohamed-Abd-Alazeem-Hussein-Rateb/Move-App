import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';

class TrendingBodyContent extends StatelessWidget {
  const TrendingBodyContent({super.key, required this.movie});
  final HomeMovieModle movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.poster_path}',
          height: 210,
          width: 145,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: SizedBox(
              height: 24, // حدد الحجم المناسب للـ CircularProgressIndicator
              width: 24, // حدد الحجم المناسب للـ CircularProgressIndicator
              child: CircularProgressIndicator(
                strokeWidth: 2, // تقليل عرض الخط
                color: Colors.blue,
              ),
            ),
          ), // لودينج أثناء تحميل الصورة
          errorWidget: (context, url, error) =>
              const Icon(Icons.error), // لو في خطأ في تحميل الصورة
        ),
      ),
    );
  }
}
