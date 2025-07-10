import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Hadith/hadith_item.dart';

class HadithTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: double.infinity,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
              ),
              itemCount: 50,
              itemBuilder: (_, index, _) => HadithItem(index: index),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Swipe Right For The Next Hadith \u2192',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
