import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Radio/items/reciters_item.dart';

class RecitersContentTab extends StatelessWidget {
  const RecitersContentTab({super.key});

  static const List<String> reciters = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (_, index) =>
          RecitersItem(recitersNameText: reciters[index]),
      itemCount: reciters.length,
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.transparent),
    );
  }
}
