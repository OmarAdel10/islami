import 'package:flutter/material.dart';
import 'package:islami/Screens/home/navBar_selected_item.dart';
import 'package:islami/Screens/home/navBar_unselected_item.dart';
import 'package:islami/Screens/home/tabs/hadith_tab.dart';
import 'package:islami/Screens/home/tabs/quran_tab.dart';
import 'package:islami/Screens/home/tabs/radio_tab.dart';
import 'package:islami/Screens/home/tabs/sebha_tab.dart';
import 'package:islami/Screens/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Image.asset(
              'assets/images/header.png',
              height: MediaQuery.of(context).size.height * 0.17,
            ),
          ),
          tabs[_currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
        BottomNavigationBarItem(
          icon: NavbarUnselectedItem(iconName: 'quran_icon'),
          activeIcon: NavBarSelectedItem(iconName: 'quran_icon'),
          label: 'Quran',
        ),
        BottomNavigationBarItem(
          icon: NavbarUnselectedItem(iconName: 'hadith_icon'),
          activeIcon: NavBarSelectedItem(iconName: 'hadith_icon'),
          label: 'Hadith',
        ),
        BottomNavigationBarItem(
          icon: NavbarUnselectedItem(iconName: 'sebha_icon'),
          activeIcon: NavBarSelectedItem(iconName: 'sebha_icon'),
          label: 'Sebha',
        ),
        BottomNavigationBarItem(
          icon: NavbarUnselectedItem(iconName: 'radio_icon'),
          activeIcon: NavBarSelectedItem(iconName: 'radio_icon'),
          label: 'Radio',
        ),
        BottomNavigationBarItem(
          icon: NavbarUnselectedItem(iconName: 'time_icon'),
          activeIcon: NavBarSelectedItem(iconName: 'time_icon'),
          label: 'Time',
        ),
      ]),
    );
  }
}
