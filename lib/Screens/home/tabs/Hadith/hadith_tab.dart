import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Hadith/hadith_item.dart';

class HadithTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: double.infinity,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
        ),
        itemCount: 50,
        itemBuilder: (_, index, _) => HadithItem(index: index),
      ),
    );
  }
}
