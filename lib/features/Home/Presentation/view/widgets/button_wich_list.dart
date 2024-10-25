import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/features/Home/data/modle/home_movie_modle.dart';
import 'package:moveapp/features/Witch_list.dart/presentation/manage/cubit/witch_list_cubit.dart';

class ButtonWichList extends StatelessWidget {
  const ButtonWichList({super.key, required this.movie});
   final HomeMovieModle movie;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WitchListCubit, WitchListState>(
      builder: (context, state) {
        var witchList = BlocProvider.of<WitchListCubit>(context);
        bool isWitchList = witchList.witchList.contains(movie);
        return InkWell(
          onTap: () {
            BlocProvider.of<WitchListCubit>(context).toggleWitchList(movie);
          },
          child: isWitchList ? const Icon(Icons.bookmark, color: Colors.blue) :  Icon(
            Icons.bookmark_add_outlined,
            color:isWitchList ? Colors.blue :  Colors.white,
          ),
        );
      },
    );
  }
}
