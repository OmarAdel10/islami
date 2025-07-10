import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Hadith/hadith.dart';
import 'package:islami/appTheme.dart';

class HadithDetails extends StatelessWidget {
  static const String routeName = '/hadithDetails';
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.sizeOf(context);
    Hadith hadith = ModalRoute.of(context)!.settings.arguments as Hadith;
    return Scaffold(
      appBar: AppBar(title: Text('Hadith ${hadith.num}')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/sura_details_left.png',
                  height: size.height * 0.1,
                  fit: BoxFit.fill,
                ),
                Expanded(
                      child: Text(
                        hadith.title,
                        textAlign: TextAlign.center,
                        style: textTheme.headlineSmall,
                      ),
                    ),
                Image.asset(
                  'assets/images/sura_details_right.png',
                  height: size.height * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder:
                  (_, index) => Text(
                    hadith.content[index],
                    style: textTheme.titleLarge!.copyWith(
                      color: AppTheme.primary,
                      height: 2,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
              itemCount: hadith.content.length,
              separatorBuilder: (_, __) => SizedBox(height: 12),
            ),
          ),
          SizedBox(height: 20),

          Image.asset(
            'assets/images/sura_details_footer.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
