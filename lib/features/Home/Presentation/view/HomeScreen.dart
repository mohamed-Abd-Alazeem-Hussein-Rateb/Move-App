import 'package:flutter/material.dart';
import 'package:moveapp/core/utils/constant.dart';
import 'package:moveapp/features/Home/Presentation/view/widgets/Home_screen_body.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimariyColor,
      body: HomeScreenBody(),
    ); 
    
  }
}