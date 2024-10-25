import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/core/utils/constant.dart';
import 'package:moveapp/features/Search/Presentation/manage/feachsearchmovie_cubit/feachsearchmovie_cubit.dart';
import 'package:moveapp/features/Search/Presentation/view/widgets/search_content_list.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // لما ترجع للصفحة تمسح البحث
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<FeatchSearchMovieCubit>(context);
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 25,
              color: Colors.white,
            ),
            Text(
              'Search',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.info_outline,
              size: 25,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
              color: kPrimariyColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  searchCubit.getSearchMove(query: value);
                } else {
                  searchCubit.movies.clear();
                  searchCubit.emit(FeatchsearchmovieInitial());
                }
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon:const Icon(Icons.search, color: Colors.white),
                suffixIcon: InkWell(
                  onTap: () {
                    _searchController.clear();
                    searchCubit.movies.clear();
                    searchCubit.emit(FeatchsearchmovieInitial());
                  },
                  child: Icon(Icons.clear, color: Colors.white),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SearchContentList(),
      ],
    );
  }
}


