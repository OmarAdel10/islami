import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Quran/quran_details.dart';

class SuraItem extends StatelessWidget {
  final int index;
  SuraItem({required this.index});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              index >= 99 
              ? Text('${index + 1}', style: textTheme.titleLarge!.copyWith(fontSize: 16))
              : Text('${index + 1}', style: textTheme.titleLarge),
              Image.asset(
                'assets/images/sura_number_frame.png',
                width: 52,
                height: 52,
                fit: BoxFit.fill,
              ),
            ],
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.06),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranDetails.englishSuras[index],
                style: textTheme.titleLarge,
              ),
              Text(
                '${QuranDetails.ayatNumbers[index]} Verses',
                style: textTheme.titleSmall,
              ),
            ],
          ),
          Spacer(),
          Text(
                QuranDetails.arabicSuras[index],
                style: textTheme.titleLarge,
              ),
        ],
      ),
    );
  }
}
