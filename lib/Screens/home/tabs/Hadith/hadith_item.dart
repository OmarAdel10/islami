import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Hadith/hadith_details.dart';
import 'package:islami/appTheme.dart';
import 'package:islami/features/hadith/data/models/hadith_model.dart';

class HadithItem extends StatelessWidget {
  final HadithModel hadith;

  const HadithItem({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(HadithDetails.routeName, arguments: hadith);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/hadith_header_left.png',
                    height: size.height * 0.1,
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                    child: Text(
                      hadith.title,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall!.copyWith(
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/hadith_header_right.png',
                    height: size.height * 0.1,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/hadith_cardbackground.png',
                    ),
                  ),
                ),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (_, index) => Text(
                    hadith.content[index],
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium!.copyWith(
                      color: AppTheme.white,
                    ),
                  ),
                  separatorBuilder: (_, __) => SizedBox(height: 4),
                  itemCount: hadith.content.length,
                ),
              ),
            ),
            Image.asset(
              'assets/images/hadith_footer.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
