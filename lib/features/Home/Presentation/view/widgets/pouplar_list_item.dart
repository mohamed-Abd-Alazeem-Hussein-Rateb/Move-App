import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/features/Home/Presentation/Manage/get_popular_data_cubit/get_popular_data_cubit.dart';
import 'package:moveapp/features/Home/Presentation/view/book_detail_screen.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/list_body.dart';

class PouplarListItem extends StatelessWidget {
  const PouplarListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularDataCubit, GetPopularDataState>(
      builder: (context, state) {
        if (state is GetPopularDataLoaded) {
          return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: state.movies.length,
          itemBuilder: (context, index) {
            return  InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailScreen(homeMovieModle: state.movies[index],)));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 7),
                child: PoublarBody(
                  homeMovieModle: state.movies[index],
                ),
              ),
            );
          }),
    );
        } else if (state is GetPopularDataError) {
          return Text(state.message);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
      );
  }
}
