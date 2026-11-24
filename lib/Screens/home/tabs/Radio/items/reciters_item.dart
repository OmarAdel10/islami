import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/appTheme.dart';
import 'package:islami/features/radio/cubit/radio_cubit.dart';
import 'package:islami/features/radio/data/models/radio_reciter.dart';

class RecitersItem extends StatelessWidget {
  final RadioReciter reciter;

  const RecitersItem({super.key, required this.reciter});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RadioCubit>();
    final isPlaying =
        cubit.state.isPlaying && cubit.state.selectedReciter?.id == reciter.id;

    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: size.height * 0.17,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size.height * 0.03,
            child: Text(
              reciter.name,
              style: textTheme.titleLarge!.copyWith(color: AppTheme.black),
            ),
          ),
          Positioned(
            bottom: 0,
            child: isPlaying
                ? Image.asset(
                    'assets/images/played_radio_reciters_item_background.png',
                  )
                : Image.asset(
                    'assets/images/paused_radio_reciters_item_background.png',
                  ),
          ),
          Positioned(
            bottom: 0,
            child: IconButton(
              iconSize: 44,
              onPressed: () async {
                if (isPlaying) {
                  await cubit.pause();
                } else {
                  cubit.selectReciter(reciter);
                  final firstSurah = reciter.surahs.isNotEmpty
                      ? reciter.surahs.first
                      : 0;
                  if (firstSurah > 0) {
                    await cubit.playSurah(firstSurah);
                  }
                }
              },
              icon: Icon(
                isPlaying
                    ? CupertinoIcons.pause_fill
                    : CupertinoIcons.play_arrow_solid,
                color: AppTheme.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
