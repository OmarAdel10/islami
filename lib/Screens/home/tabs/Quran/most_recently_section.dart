import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Screens/home/tabs/Quran/quran_details.dart';
import 'package:islami/Screens/home/tabs/Quran/sura_details.dart';
import 'package:islami/Screens/home/tabs/Quran/items/most_recently_item.dart';
import 'package:islami/features/quran/cubit/quran_cubit.dart';
import 'package:islami/features/quran/cubit/quran_state.dart';

class MostRecentlySection extends StatelessWidget {
  final int suraCount;
  const MostRecentlySection({required this.suraCount, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        final textTheme = Theme.of(context).textTheme;
        final size = MediaQuery.of(context).size;

        return Visibility(
          visible: state.recentIndexes.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
                child: Text('Most Recently', style: textTheme.titleMedium),
              ),
              SizedBox(
                height: size.height * 0.15,
                child: ListView.separated(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final suraIndx = state.recentIndexes[index];
                    return GestureDetector(
                      onTap: () async {
                        final cubit = context.read<QuranCubit>();
                        await Navigator.of(context).pushNamed(
                          SuraDetails.routeName,
                          arguments: {
                            'english': QuranDetails.englishSuras[suraIndx],
                            'arabic': QuranDetails.arabicSuras[suraIndx],
                            'index': suraIndx,
                          },
                        );
                        cubit.onSuraTapped(suraIndx, suraCount);
                      },
                      child: MostRecentlyItem(index: suraIndx),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemCount: state.recentIndexes.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
