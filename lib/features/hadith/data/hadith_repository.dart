import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:islami/features/hadith/data/models/hadith_model.dart';

class HadithRepository {
  Future<List<HadithModel>> loadHadiths() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/hadith/hadiths.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final List<dynamic> hadithsJson = jsonMap['hadiths'] as List<dynamic>;
    return hadithsJson
        .map(
          (json) => HadithModel(
            id: json['id'] as String,
            number: json['number'] as int,
            title: json['title'] as String,
            content: List<String>.from(json['content'] as List<dynamic>),
            categories: List<String>.from(json['categories'] as List<dynamic>),
          ),
        )
        .toList();
  }

  List<HadithModel> filterByCategory(
    List<HadithModel> hadiths,
    String category,
  ) {
    if (category == 'all' || category.isEmpty) {
      return hadiths;
    }
    return hadiths
        .where((hadith) => hadith.categories.contains(category))
        .toList();
  }
}
