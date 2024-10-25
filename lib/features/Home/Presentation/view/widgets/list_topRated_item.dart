import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/features/Home/Presentation/Manage/get_top_reated_data_state/get_top_reated_data_cubit.dart';
import 'package:moveapp/features/Home/Presentation/view/book_detail_screen.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/list_body.dart';

class ListTopRated extends StatelessWidget {
  const ListTopRated({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopReatedDataCubit, GetTopReatedDataState>(
      builder: (context, state) {
        if(state is GetTopReatedDataSuccess){
          return SizedBox(
      height: 150,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
          return  InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  BookDetailScreen(
                homeMovieModle:state.movies[index],
              )));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 7),
               child:  PoublarBody(
                homeMovieModle: state.movies[index],
               ),
            ),
          );
        }
        ),
    );
        } else if(state is GetTopReatedDataLoading){
          return const Center(child: CircularProgressIndicator());
        } else if(state is GetTopReatedDataError){
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      }
      );
  }
}