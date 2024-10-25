import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/features/Home/Presentation/view/book_detail_screen.dart';
import 'package:moveapp/features/Search/Presentation/manage/feachsearchmovie_cubit/feachsearchmovie_cubit.dart';
import 'package:moveapp/features/Search/Presentation/view/widgets/search_body_content.dart';

class SearchContentList extends StatelessWidget {
  const SearchContentList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatchSearchMovieCubit, FeachsearchmovieState>(
      builder: (context, state) {
        if (state is FeatchsearchmovieSuccess) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return BookDetailScreen(homeMovieModle: state.movies[index],);
                    }));
                  },
                  child: SearchBodyContent(
                    movie: state.movies[index],
                  ),
                );
              },
            ),
          );
        } else if (state is FeatchsearchmovieError) {
          return Text(state.message);
        } else if (state is FeatchsearchmovieInitial) {
          return Center(
            child: Image.asset(
              'assets/searchman.png',
              height: 420,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
