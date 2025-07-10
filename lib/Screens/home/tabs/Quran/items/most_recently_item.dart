import 'package:flutter/material.dart';
import 'package:islami/appTheme.dart';

class MostRecentlyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme texttheme = Theme.of(context).textTheme;
    Size size = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      width: size.width * 0.7,
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
                'Al-Anbiya',
                style: texttheme.headlineSmall!.copyWith(color: AppTheme.black),
              ),
              Text(
                'الأنبياء',
                style: texttheme.headlineSmall!.copyWith(color: AppTheme.black),
              ),
              Text(
                '112 Verses',
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
