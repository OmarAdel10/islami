import 'package:equatable/equatable.dart';

class RadioReciter extends Equatable {
  final String id;
  final String name;
  final String server;
  final String rewaya;
  final int count;
  final String letter;
  final List<int> surahs;

  const RadioReciter({
    required this.id,
    required this.name,
    required this.server,
    required this.rewaya,
    required this.count,
    required this.letter,
    required this.surahs,
  });

  factory RadioReciter.fromJson(Map<String, dynamic> json) {
    final surahsStr = (json['suras'] ?? '') as String;
    final surahs = surahsStr.isEmpty
        ? <int>[]
        : surahsStr
              .split(',')
              .where((s) => s.isNotEmpty)
              .map(int.parse)
              .toList();

    return RadioReciter(
      id: (json['id'] ?? '') as String,
      name: (json['name'] ?? '') as String,
      server: (json['Server'] ?? '') as String,
      rewaya: (json['rewaya'] ?? '') as String,
      count: int.tryParse(json['count'] ?? '0') ?? 0,
      letter: (json['letter'] ?? '') as String,
      surahs: surahs,
    );
  }

  String surahUrl(int surahNumber) {
    return '${server.replaceAll(RegExp(r'/$'), '')}/${surahNumber.toString().padLeft(3, '0')}.mp3';
  }

  @override
  List<Object?> get props => [id, name, server, rewaya, count, letter, surahs];
}
