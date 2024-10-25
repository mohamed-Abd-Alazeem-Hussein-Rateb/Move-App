import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/features/Home/Presentation/Manage/get_cast_cubit/get_cast_cubit.dart';
import 'package:moveapp/features/Home/Presentation/Manage/get_popular_data_cubit/get_popular_data_cubit.dart';
import 'package:moveapp/features/Home/Presentation/Manage/get_top_reated_data_state/get_top_reated_data_cubit.dart';
import 'package:moveapp/features/Home/Presentation/Manage/get_trending_movies_cubit/get_trending_movies_cubit.dart';
import 'package:moveapp/features/Home/Presentation/view/dash_board_screen.dart';
import 'package:moveapp/features/Home/data/rebo/home_rebo_impl.dart';
import 'package:moveapp/features/Splach_screen/Presentation/view/Splach_screen.dart';
import 'package:moveapp/features/Witch_list.dart/presentation/manage/cubit/witch_list_cubit.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MoveApp(), // Wrap your app
    ),
  );
}

class MoveApp extends StatelessWidget {
  const MoveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetTrendingMoviesCubit(HomeReboImpl(dio: Dio()))..getTrendingMovies()),
        BlocProvider(create: (context) => GetPopularDataCubit(HomeReboImpl(dio: Dio()))..getPopularData()),
        BlocProvider(create: (context) => GetTopReatedDataCubit(HomeReboImpl(dio: Dio()))..getTopRatedData()), // أضف هذا الكود هنا
        BlocProvider(create: (context) => GetCastCubit(HomeReboImpl(dio: Dio()))),
        BlocProvider(create: (context) => WitchListCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

