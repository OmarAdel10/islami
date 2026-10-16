part of 'hadith_cubit.dart';

class HadithState extends Equatable {
  final List<HadithModel> hadiths;
  final List<HadithModel> filteredHadiths;
  final String selectedCategory;
  final bool isLoading;
  final String? errorMessage;

  const HadithState({
    required this.hadiths,
    required this.filteredHadiths,
    required this.selectedCategory,
    required this.isLoading,
    this.errorMessage,
  });

  factory HadithState.initial() {
    return const HadithState(
      hadiths: [],
      filteredHadiths: [],
      selectedCategory: 'all',
      isLoading: false,
      errorMessage: null,
    );
  }

  HadithState copyWith({
    List<HadithModel>? hadiths,
    List<HadithModel>? filteredHadiths,
    String? selectedCategory,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HadithState(
      hadiths: hadiths ?? this.hadiths,
      filteredHadiths: filteredHadiths ?? this.filteredHadiths,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    hadiths,
    filteredHadiths,
    selectedCategory,
    isLoading,
    errorMessage,
  ];
}
