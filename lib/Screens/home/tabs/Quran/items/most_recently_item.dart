import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Quran/quran_details.dart';
import 'package:islami/appTheme.dart';

class MostRecentlyItem extends StatelessWidget {
  final int index;
  const MostRecentlyItem({required this.index});
  @override
  Widget build(BuildContext context) {
    TextTheme texttheme = Theme.of(context).textTheme;
    Size size = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      // width: size.width * 0.8, // اعتقد كدا افضل من تحديد عرض محدد لان لقيت عندي اني محتاج احط عرض كبير عشان الاوفر فلو ولقيت الشكل كدا مش لطيف
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                QuranDetails.englishSuras[index],
                style: texttheme.headlineSmall!.copyWith(color: AppTheme.black),
              ),
              Text(
                QuranDetails.arabicSuras[index],
                style: texttheme.headlineSmall!.copyWith(color: AppTheme.black),
              ),
              Text(
                '${QuranDetails.ayatNumbers[index]} Verses',
                style: texttheme.titleSmall!.copyWith(color: AppTheme.black),
              ),
            ],
          ),
          Image.asset(
            'assets/images/most_recently.png',
            width: size.width * 0.35,
            height: size.height * 0.4,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
