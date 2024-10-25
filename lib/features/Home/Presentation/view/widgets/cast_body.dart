import 'package:flutter/material.dart';
import 'package:moveapp/features/Home/data/modle/cast_modle.dart';

class CastBody extends StatelessWidget {
  const CastBody({super.key, required this.castModle});
  final CastModle castModle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 104, 242, 255),
                Color.fromARGB(255, 253, 62, 4)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ClipOval(
            child: Container(
              child: castModle.profile_path != null
                  ? Image.network(
                      'https://image.tmdb.org/t/p/w500/${castModle.profile_path}',
                      fit: BoxFit.fill,
                      width: 85,
                      height: 86,
                    )
                  : Image.asset(
                      'assets/charile.png', // تأكد من إضافة صورة افتراضية في assets
                      fit: BoxFit.fill,
                      width: 85,
                      height: 86,
                    ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 95, maxWidth: 130),
          child: Text(
            castModle.character ?? 'Unknown', // استخدم قيمة افتراضية إذا كانت null
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: const TextStyle(fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
