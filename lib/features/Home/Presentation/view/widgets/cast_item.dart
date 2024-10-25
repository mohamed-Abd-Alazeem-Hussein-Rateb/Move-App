import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/features/Home/Presentation/Manage/get_cast_cubit/get_cast_cubit.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/cast_body.dart';

class CastItem extends StatelessWidget {
  const CastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCastCubit, GetCastState>(
      builder: (context, state) {
        if (state is GetCastLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetCastSuccess) {
          return SizedBox(
      height: 136,
      child: ListView.builder(
        itemCount: state.cast.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context,index) {
          return  Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CastBody(
             castModle: state.cast[index],
            ),
          );
        }
        ),
    );
        } else if (state is GetCastError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      }
      );
  }
}