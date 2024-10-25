import 'package:flutter/material.dart';
import 'package:moveapp/core/utils/constant.dart';
import 'package:moveapp/features/Home/Presentation/view/dash_board_screen.dart';
import 'dart:async';

import 'package:moveapp/features/Splach_screen/Presentation/view/widgets/splach_screen_body.dart'; // استيراد مكتبة الـ Future

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    
    // إضافة delay لمدة 3 ثواني قبل الانتقال
    Future.delayed(const Duration(seconds: 3), () {
      // الانتقال للشاشة التالية
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashBoardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimariyColor,
      body: SplachScreenBody(),
    );
  }
}