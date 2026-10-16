import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/hadith/cubit/hadith_cubit.dart';
import 'package:islami/features/hadith/data/hadith_repository.dart';
import 'package:islami/Screens/home/tabs/Hadith/hadith_item.dart';
import 'package:islami/widgets/loading_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HadithCubit(hadithRepository: HadithRepository())..loadHadiths(),
      child: const _HadithTabView(),
    );
  }
}

class _HadithTabView extends StatelessWidget {
  const _HadithTabView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithCubit, HadithState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: LoadingIndicator());
        }
        if (state.errorMessage != null) {
          return Center(
            child: Text(
              'Error: ${state.errorMessage}',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          );
        }
        if (state.filteredHadiths.isEmpty) {
          return Center(
            child: Text(
              'No hadiths found for this category.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          );
        }
        return Column(
          children: [
            _CategoryChips(
              selectedCategory: state.selectedCategory,
              onCategoryChanged: (category) {
                context.read<HadithCubit>().changeCategory(category);
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CarouselSlider.builder(
                  itemCount: state.filteredHadiths.length,
                  itemBuilder: (context, index, _) =>
                      HadithItem(hadith: state.filteredHadiths[index]),
                  options: CarouselOptions(
                    height: double.infinity,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Swipe Right For The Next Hadith \u2192',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CategoryChips extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;

  const _CategoryChips({
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Define the categories we want to show
    final List<String> categories = ['all', 'general', 'morning', 'evening'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: categories
            .map((category) => _buildChip(context, category))
            .toList(),
      ),
    );
  }

  Widget _buildChip(BuildContext context, String category) {
    final bool isSelected = selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(_getCategoryLabel(category)),
        selected: isSelected,
        onSelected: (_) => onCategoryChanged(category),
        selectedColor: Theme.of(context).colorScheme.primaryContainer,
        labelStyle: TextStyle(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
    );
  }

  String _getCategoryLabel(String category) {
    switch (category) {
      case 'all':
        return 'الكل';
      case 'general':
        return 'عام';
      case 'morning':
        return 'حديث الصباح';
      case 'evening':
        return 'حديث المساء';
      default:
        return category;
    }
  }
}
