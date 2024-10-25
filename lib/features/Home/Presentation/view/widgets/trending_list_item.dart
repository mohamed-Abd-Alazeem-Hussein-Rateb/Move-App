
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/features/Home/Presentation/Manage/get_trending_movies_cubit/get_trending_movies_cubit.dart';
import 'package:moveapp/features/Home/Presentation/view/book_detail_screen.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/trending_body_content.dart';

class TrendingListItem extends StatelessWidget {
  const TrendingListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTrendingMoviesCubit, GetTrendingMoviesState>(
      builder: (context, state) {
        if (state is GetTrendingMoviesSuccess) {
          return SizedBox(
            height: 216,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
         return  InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  BookDetailScreen(
              homeMovieModle:state.movies[index],
            )));
          },
           child: TrendingBodyContent(
            movie: state.movies[index],
           ),
         );
      }),
    );
        } else if (state is GetTrendingMoviesError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
      );
  }
}