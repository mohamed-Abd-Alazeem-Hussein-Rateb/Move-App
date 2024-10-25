import 'package:flutter/material.dart';

class SplachScreenBody extends StatelessWidget {
  const SplachScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image(
            image: AssetImage('assets/popcorn 1.png'),
            height: 250,
            width: 250,
          ),
        ),
      ],
    );
  }
}