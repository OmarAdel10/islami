import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Quran/quran_details.dart';
import 'package:islami/Screens/home/tabs/Quran/sura_details.dart';
import 'package:islami/Screens/home/tabs/Quran/sura_item.dart';
import 'package:islami/appTheme.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Suras List',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder:
                (_, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      SuraDetails.routeName,
                      arguments: {
                        'english' : QuranDetails.englishSuras[index],
                        'arabic' : QuranDetails.arabicSuras[index],
                        'index' : index,
                      },
                    );
                  },
                  child: SuraItem(index: index),
                ),
            itemCount: QuranDetails.ayatNumbers.length,
            separatorBuilder:
                (_, index) => Divider(
                  color: AppTheme.white,
                  height: 20,
                  thickness: 1.0,
                  indent: size.width * 0.18,
                  endIndent: size.width * 0.18,
                ),
          ),
        ),
      ],
    );
  }
}
