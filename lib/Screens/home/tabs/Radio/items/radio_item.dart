import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/appTheme.dart';

class RadioItem extends StatefulWidget {
  final String radioNameText;

  RadioItem({required this.radioNameText});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlayTaped = false;
  bool isSoundTaped = false;

  @override
  Widget build(BuildContext context) {
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
            child: isPlayTaped ? Image.asset('assets/images/played_radio_reciters_item_background.png') : Image.asset(
              'assets/images/paused_radio_reciters_item_background.png',
            ),
          ),

          Positioned(
            bottom: 0,
            child: IconButton(
              iconSize: 44,
              onPressed: () {
                setState(() {
                  isPlayTaped = !isPlayTaped;
                });
              },
              icon: Icon(
                isPlayTaped
                    ? CupertinoIcons.pause_fill
                    : CupertinoIcons.play_arrow_solid,
                color: AppTheme.black,
              ),
            ),
          ),

          Positioned(
            right: size.width * 0.2,
            bottom: 0,
            child: IconButton(
              iconSize: 40,
              onPressed: () {
              setState(() {
                isSoundTaped = !isSoundTaped;
              });
              },
              icon: Icon(
                isSoundTaped
                    ? CupertinoIcons.speaker_slash_fill
                    : CupertinoIcons.speaker_2_fill,
                color: AppTheme.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
