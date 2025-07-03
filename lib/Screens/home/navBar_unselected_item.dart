import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavbarUnselectedItem extends StatelessWidget {
  final String iconName;

  const NavbarUnselectedItem({required this.iconName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      width: 26,
      height: 26,
      fit: BoxFit.fill,
    );
  }
}
