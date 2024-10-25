import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/core/utils/constant.dart';
import 'package:moveapp/features/Search/Presentation/manage/feachsearchmovie_cubit/feachsearchmovie_cubit.dart';
import 'package:moveapp/features/Search/Presentation/view/widgets/search_body.dart';
import 'package:moveapp/features/Search/data/rebo/search_rebo_impl.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: kPrimariyColor,
        body: BlocProvider(
          create: (context) => FeatchSearchMovieCubit(SearchReboImpl(dio: Dio())),
          child:const Padding(padding: EdgeInsets.all(8.0), child: SearchBody()),
        ));
  }
}
