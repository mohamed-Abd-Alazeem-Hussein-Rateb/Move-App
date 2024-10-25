import 'package:flutter/material.dart';
import 'package:moveapp/core/utils/constant.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/list_topRated_item.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/pouplar_list_item.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/trending_list_item.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(  // تم إضافة الـ SingleChildScrollView
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
           const SizedBox(height: 45,),
           const Text('What do you want to watch?', style: TextStyle(color: Colors.white, fontSize: 20)),
           const SizedBox(height: 15,),
            Container(
               decoration: BoxDecoration(
                 gradient:const LinearGradient(
                   colors: [Colors.blue, Colors.purple], // ألوان الـ gradient
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight,
                 ),
                 borderRadius: BorderRadius.circular(18), // إضافة حواف دائرية
               ),
               padding:const EdgeInsets.all(2), // padding لتجنب تداخل الـ TextField مع الحواف
               child: Container(
                 decoration: BoxDecoration(
                   color: kPrimariyColor,
                   borderRadius: BorderRadius.circular(16), // نفس نصف القطر الداخلي للحواف
                 ),
                 child:const TextField(
                   decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(16)), // الحواف الداخلية
                       borderSide: BorderSide.none, // إخفاء الحدود الافتراضية
                     ),
                     hintText: 'Search',
                     hintStyle: TextStyle(color: Colors.white),
                     suffixIcon: Icon(Icons.search, color: Colors.white),
                     contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14), // مساحة داخلية للنص
                   ),
                 ),
               ),
             ),
          const  SizedBox(height: 20,),
          const  Text('Trending Now', style: TextStyle(color: Colors.white, fontSize: 18)),
          const  SizedBox(height: 15,),
          const  TrendingListItem(),
           const SizedBox(height: 10,),
          const  Text('Pouplar Now', style: TextStyle(color: Colors.white, fontSize: 18)),
          const  SizedBox(height: 11,),
           const PouplarListItem(),
          const  SizedBox(height: 7,),
          const  Text('Top Rated', style: TextStyle(color: Colors.white, fontSize: 18)),
          const  SizedBox(height: 11,),
          const  ListTopRated(),
          ],
        ),
      ),
    );
  }
}
