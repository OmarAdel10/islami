import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Quran/items/most_recently_item.dart';
import 'package:islami/Screens/home/tabs/Quran/quran_details.dart';
import 'package:islami/Screens/home/tabs/Quran/sura_details.dart';

class MostRecentlySection extends StatefulWidget {
  final List<int> recentIndexes;
  const MostRecentlySection({required this.recentIndexes});

  @override
  State<MostRecentlySection> createState() => _MostRecentlySectionState();
}

class _MostRecentlySectionState extends State<MostRecentlySection> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.sizeOf(context);

    return Visibility(
      visible: widget.recentIndexes.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
            child: Text('Most Recently', style: textTheme.titleMedium),
          ),
          SizedBox(
            height: size.height * 0.15,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                int suraIndx = widget.recentIndexes[index];
                return GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).pushNamed(
                      SuraDetails.routeName,
                      arguments: {
                        'english': QuranDetails.englishSuras[suraIndx],
                        'arabic': QuranDetails.arabicSuras[suraIndx],
                        'index': suraIndx,
                      },
                    );

                    setState(() {
                      widget.recentIndexes.remove(suraIndx);
                      widget.recentIndexes.insert(0, suraIndx);
                    });
                  },
                  child: MostRecentlyItem(index: suraIndx),
                );
              },
              separatorBuilder: (_, __) => SizedBox(width: 10),
              itemCount: widget.recentIndexes.length,
            ),
          ),
        ],
      ),
    );
  }
}
