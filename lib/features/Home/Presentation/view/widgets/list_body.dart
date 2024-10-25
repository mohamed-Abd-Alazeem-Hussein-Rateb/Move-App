import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';

class PoublarBody extends StatelessWidget {
  const PoublarBody({super.key, required this.homeMovieModle});
  final HomeMovieModle homeMovieModle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
  borderRadius: const BorderRadius.all(Radius.circular(15)),
  child: homeMovieModle.poster_path.isNotEmpty
      ? CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${homeMovieModle.poster_path}',
          height: 146,
          width: 100,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(), // Placeholder أثناء تحميل الصورة
          ),
          errorWidget: (context, url, error) => Image.asset(
            'assets/movie-1.png', // صورة افتراضية عند حدوث خطأ
            height: 146,
            width: 100,
            fit: BoxFit.cover,
          ),
        )
      : Image.asset(
          'assets/movie-1.png', // صورة افتراضية في حالة عدم وجود poster_path
          height: 146,
          width: 100,
          fit: BoxFit.cover,
        ),
),

        Positioned(
            bottom: 9,
            left: 47,
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  homeMovieModle.vote_average.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ],
    );
  }
}
