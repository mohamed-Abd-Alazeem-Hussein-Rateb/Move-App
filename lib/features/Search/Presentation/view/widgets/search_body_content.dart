import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moveapp/core/utils/constant.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';

class SearchBodyContent extends StatelessWidget {
  const SearchBodyContent({super.key, required this.movie});
  final HomeMovieModle movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 193, 25, 239),
                  Color.fromARGB(255, 253, 4, 137)
                ], // ألوان الـ gradient
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10), // حواف دائرية
            ),
            padding: const EdgeInsets.all(3), // Padding لتجنب التداخل
            child: Container(
              decoration: BoxDecoration(
                color: kPrimariyColor, // لون خلفية داخلي
                borderRadius:
                    BorderRadius.circular(8), // نفس نصف القطر الداخلي للحواف
              ),
              padding: const EdgeInsets.all(10), // Padding داخلي لعناصر الـ Row
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(19), // زيادة قيمة borderRadius تجعل الصورة دائرية أكثر
                    child: CachedNetworkImage(
                      imageUrl: movie.backdrop_path != null &&
                              movie.backdrop_path!.isNotEmpty
                          ? 'https://image.tmdb.org/t/p/w500/${movie.backdrop_path}'
                          : '', // اتركها فارغة أو استخدم صورة فارغة

                      placeholder: (context, url) => const Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ))),
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/movie-1.png'),
                      fit: BoxFit.cover,
                      height: 120,
                      width: 95,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.original_title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_outline_outlined,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              movie.vote_average.toString(),
                              style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        const Row(
                          children: [
                            const Icon(
                              Icons.movie_creation_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 5),
                            const Text(
                              'Action, Thriller',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '2h 30m',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


// Color.fromARGB(255, 193, 25, 239), Color.fromARGB(255, 253, 4, 137)