import 'package:equatable/equatable.dart';

class HadithModel extends Equatable {
  final String id;
  final int number;
  final String title;
  final List<String> content;
  final List<String> categories;

  const HadithModel({
    required this.id,
    required this.number,
    required this.title,
    required this.content,
    required this.categories,
  });

  @override
  List<Object?> get props => [id, number, title, content, categories];
}
