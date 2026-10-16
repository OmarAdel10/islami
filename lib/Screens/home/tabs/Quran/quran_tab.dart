import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/Screens/home/tabs/Quran/most_recently_section.dart';
import 'package:islami/Screens/home/tabs/Quran/quran_details.dart';
import 'package:islami/Screens/home/tabs/Quran/sura_details.dart';
import 'package:islami/Screens/home/tabs/Quran/items/sura_item.dart';
import 'package:islami/appTheme.dart';
import 'package:islami/features/quran/cubit/quran_cubit.dart';
import 'package:islami/features/quran/cubit/quran_state.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuranCubit(),
      child: const _QuranTabView(),
    );
  }
}

class _QuranTabView extends StatefulWidget {
  const _QuranTabView();

  @override
  State<_QuranTabView> createState() => _QuranTabViewState();
}

class _QuranTabViewState extends State<_QuranTabView> {
  late final int suraCount = QuranDetails.arabicSuras.length;

  @override
  void initState() {
    super.initState();
    context.read<QuranCubit>().loadRecentIndexes(suraCount);
  }

  bool _matches(int index, String query) {
    return QuranDetails.arabicSuras[index].contains(query) ||
        QuranDetails.englishSuras[index].toLowerCase().contains(
          query.toLowerCase(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                  hintText: 'Sura Name',
                  prefixIcon: SvgPicture.asset(
                    'assets/icons/quran_icon.svg',
                    height: 28,
                    width: 28,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      AppTheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                onChanged: (query) {
                  context.read<QuranCubit>().search(query, suraCount, _matches);
                },
              ),
            ),
            MostRecentlySection(suraCount: suraCount),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Suras List',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) {
                  int currentIndex = state.matchingIndexes[index];
                  return GestureDetector(
                    onTap: () async {
                      final cubit = context.read<QuranCubit>();
                      await Navigator.of(context).pushNamed(
                        SuraDetails.routeName,
                        arguments: {
                          'english': QuranDetails.englishSuras[currentIndex],
                          'arabic': QuranDetails.arabicSuras[currentIndex],
                          'index': currentIndex,
                        },
                      );
                      cubit.onSuraTapped(currentIndex, suraCount);
                    },
                    child: SuraItem(index: currentIndex),
                  );
                },
                itemCount: state.matchingIndexes.length,
                separatorBuilder: (_, index) => Divider(
                  color: AppTheme.white,
                  height: 20,
                  thickness: 1.0,
                  indent: MediaQuery.of(context).size.width * 0.18,
                  endIndent: MediaQuery.of(context).size.width * 0.18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
