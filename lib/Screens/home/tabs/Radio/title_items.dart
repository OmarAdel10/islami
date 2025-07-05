import 'package:flutter/material.dart';
import 'package:islami/appTheme.dart';

class TitleItems extends StatelessWidget {
  bool isselected;
  String text;

  TitleItems({required this.isselected, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.045,
      decoration: BoxDecoration(
        color: isselected ? AppTheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style:
              isselected
                  ? Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: AppTheme.black)
                  : Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
        ),
      ),
    );
  }
}
