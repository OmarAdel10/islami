import 'package:flutter/material.dart';
import 'package:islami/appTheme.dart';

class LoadingIndicator extends StatelessWidget {
  Color? color;

  LoadingIndicator({this.color});
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: color ?? AppTheme.primary,
    ),);
  }
}