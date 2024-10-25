import 'package:flutter/material.dart';

class ButtonBody extends StatelessWidget {
  const ButtonBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
    padding: const EdgeInsets.all(3), // مسافة لعرض الحدود المتدرجة
    decoration:const BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        bottomLeft: Radius.circular(15),
      ),
      gradient: const LinearGradient(
        colors: [Colors.blue, Colors.purple], // ألوان الـ gradient
      ),
    ),
    child: Container(
      height: 50,
      width: 179,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: const Center(
        child: Text(
          'Free',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ),
            ),
    Container(
          padding: const EdgeInsets.all(2), // مسافة لعرض الحدود المتدرجة
          decoration:const BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            gradient: const LinearGradient(
              colors: [Colors.orange, Colors.red], // ألوان الـ gradient
            ),
          ),
          child: Container(
            height: 50,
            width: 179,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: const Center(
              child: Text(
                'Preview',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
    
  }
}