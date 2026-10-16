import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/appTheme.dart';
import 'package:islami/features/radio/cubit/radio_cubit.dart';
import 'package:islami/features/radio/data/models/radio_reciter.dart';

class RadioItem extends StatefulWidget {
  final String radioNameText;
  final RadioReciter reciter;

  const RadioItem({
    super.key,
    required this.radioNameText,
    required this.reciter,
  });

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  late final int _firstSurah;

  @override
  void initState() {
    super.initState();
    _firstSurah = widget.reciter.surahs.isNotEmpty
        ? widget.reciter.surahs.first
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RadioCubit>();
    final isPlaying =
        cubit.state.isPlaying && cubit.state.currentSurahNumber == _firstSurah;

    Size size = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
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
              widget.radioNameText,
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
                } else if (_firstSurah > 0) {
                  await cubit.playSurah(_firstSurah);
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
