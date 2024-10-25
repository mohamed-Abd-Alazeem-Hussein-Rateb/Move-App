import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/features/Search/Presentation/view/widgets/search_body_content.dart';
import 'package:moveapp/features/Witch_list.dart/presentation/manage/cubit/witch_list_cubit.dart';

class WitchListBody extends StatelessWidget {
  const WitchListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WitchListCubit, WitchListState>(
      builder: (context, state) {
         if (state is WitchListsuccess) {
          return ListView.builder(
          itemCount: state.witchList.length,
          itemBuilder: (context, index) {
            return SearchBodyContent(movie:state.witchList[index],);
          },
          );
         } else {
          return const Center(child: CircularProgressIndicator());
         }
      },
    );
  }
}