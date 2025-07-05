import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Radio/items/reciters_item.dart';

class RecitersContentTab extends StatelessWidget {
  List<String> reciters = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      itemBuilder: (_, index) => RecitersItem(recitersNameText: reciters[index],),
      itemCount: reciters.length,
      separatorBuilder: (context, index) => Divider(color: Colors.transparent),
    );
  }
}
