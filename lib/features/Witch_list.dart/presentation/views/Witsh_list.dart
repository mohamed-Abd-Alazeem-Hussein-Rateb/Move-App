import 'package:flutter/material.dart';
import 'package:moveapp/core/utils/constant.dart';
import 'package:moveapp/features/Witch_list.dart/presentation/views/widgets/witch_list_body.dart';

class WitshListScreen extends StatelessWidget {
  const WitshListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimariyColor,
      appBar: AppBar(
        backgroundColor: kPrimariyColor,
        title:const Text('Witch List',style: TextStyle(color: Colors.white),),
      ),
      body:const Padding(
        padding:  EdgeInsets.all(8.0),
        child:  WitchListBody(),
      ),
    );
  }
}