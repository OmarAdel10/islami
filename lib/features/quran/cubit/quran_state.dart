import 'package:equatable/equatable.dart';

class QuranState extends Equatable {
  final List<int> matchingIndexes;
  final List<int> recentIndexes;
  final String searchQuery;

  const QuranState({
    this.matchingIndexes = const [],
    this.recentIndexes = const [],
    this.searchQuery = '',
  });

  @override
  List<Object?> get props => [matchingIndexes, recentIndexes, searchQuery];

  QuranState copyWith({
    List<int>? matchingIndexes,
    List<int>? recentIndexes,
    String? searchQuery,
  }) {
    return QuranState(
      matchingIndexes: matchingIndexes ?? this.matchingIndexes,
      recentIndexes: recentIndexes ?? this.recentIndexes,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
