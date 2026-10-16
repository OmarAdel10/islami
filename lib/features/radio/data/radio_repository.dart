import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/features/radio/data/models/radio_reciter.dart';

class RadioRepository {
  static const String _baseUrl =
      'https://www.mp3quran.net/api/reciters_json.php';

  final http.Client _client;

  RadioRepository({http.Client? client}) : _client = client ?? http.Client();

  Future<List<RadioReciter>> fetchReciters() async {
    final response = await _client.get(Uri.parse(_baseUrl));

    if (response.statusCode != 200) {
      throw Exception('Failed to load reciters: ${response.statusCode}');
    }

    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> recitersJson = data['reciters'] as List<dynamic>;

    return recitersJson
        .map((json) => RadioReciter.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
