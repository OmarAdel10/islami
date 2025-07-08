import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/Screens/home/tabs/Quran/quran_details.dart';
import 'package:islami/Screens/home/tabs/Quran/sura_details.dart';
import 'package:islami/Screens/home/tabs/Quran/sura_item.dart';
import 'package:islami/appTheme.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> matchingIndexes = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    if (matchingIndexes.isEmpty) {
      matchingIndexes = List.generate(
        QuranDetails.arabicSuras.length,
        (i) => i,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              prefixIcon: SvgPicture.asset(
                'assets/icons/quran_icon.svg',
                height: 28,
                width: 28,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  AppTheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            onChanged: (query) {
              setState(() {
                matchingIndexes = [];

                for (int i = 0; i < QuranDetails.arabicSuras.length; i++) {
                  if (QuranDetails.arabicSuras[i].contains(query) ||
                      QuranDetails.englishSuras[i].toLowerCase().contains(query.toLowerCase())) {
                    matchingIndexes.add(i);
                  }
                }
                if (query.isEmpty) {
                  matchingIndexes = List.generate(
                    QuranDetails.arabicSuras.length,
                    (i) => i,
                  );
                }
              });
            },
          ),
        ),

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
            itemBuilder: (_, index) {
              int currentIndex = matchingIndexes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    SuraDetails.routeName,
                    arguments: {
                      'english': QuranDetails.englishSuras[currentIndex],
                      'arabic': QuranDetails.arabicSuras[currentIndex],
                      'index': currentIndex,
                    },
                  );
                },
                child: SuraItem(index: currentIndex),
              );
            },
            itemCount: matchingIndexes.length,
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
