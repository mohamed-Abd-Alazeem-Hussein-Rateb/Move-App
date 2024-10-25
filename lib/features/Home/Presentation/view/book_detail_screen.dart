import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveapp/core/utils/constant.dart';
import 'package:moveapp/features/Home/Presentation/Manage/get_cast_cubit/get_cast_cubit.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/button_body.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/button_wich_list.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/cast_item.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key, required this.homeMovieModle});
  final dynamic homeMovieModle;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  void initState() {
    super.initState();
    BlocProvider.of<GetCastCubit>(context)
        .getPepuleCast(id: widget.homeMovieModle.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimariyColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    )),
                const Text(
                  'Detail',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
               ButtonWichList(movie: widget.homeMovieModle),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius:const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: Image(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${widget.homeMovieModle.backdrop_path}',
                  ),
                  height: 210,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Positioned(
                  bottom: -72,
                  left: 31,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${widget.homeMovieModle.poster_path}',
                        height: 140,
                        width: 100,
                        fit: BoxFit.fill,
                      ))),
              Positioned(
                bottom: -56,
                left: 145,
                child: ConstrainedBox(
                  constraints:const BoxConstraints(
                    maxWidth: 210, // أقصى عرض ممكن للنص
                    minWidth: 115, // أقل عرض ممكن للنص
                  ),
                  child: Text(
                    widget.homeMovieModle.original_title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 90,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center, // لتوسيط العناصر
            children: [
              // العنصر الأول (سنة الإصدار)
              Row(
                children: [
                  Icon(
                    Icons.calendar_today, // أيقونة التقويم
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '2021', // النص
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              // خط فاصل بين العناصر
              SizedBox(
                height: 30,
                child: VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                  width: 20,
                  indent: 5,
                  endIndent: 5,
                ),
              ),

              // العنصر الثاني (مدة الفيلم)
              Row(
                children: const [
                  Icon(
                    Icons.access_time, // أيقونة الساعة
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '148 Minutes', // النص
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              // خط فاصل بين العناصر
              SizedBox(
                height: 30,
                child: VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                  width: 20,
                  indent: 5,
                  endIndent: 5,
                ),
              ),

              // العنصر الثالث (نوع الفيلم)
              Row(
                children: [
                  Icon(
                    Icons.movie, // أيقونة الفيلم
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Action', // النص
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              const Text(
                'Overview',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              widget.homeMovieModle.overview,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          const ButtonBody(),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              'Cast',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
        const  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child: const CastItem(),
          ),
        ],
      ),
    );
  }
}
