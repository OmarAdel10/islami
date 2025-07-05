import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Radio/items/radio_item.dart';

class RadioContentTab extends StatelessWidget {
  List<String> radio = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      itemBuilder: (_, index) => RadioItem(radioNameText: radio[index],),
      itemCount: radio.length,
      separatorBuilder: (context, index) => Divider(color: Colors.transparent),
    );
  }
}
