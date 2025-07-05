import 'package:flutter/material.dart';
import 'package:islami/Screens/home/tabs/Radio/title_items.dart';
import 'package:islami/Screens/home/tabs/Radio/tabs/radio_content_tab.dart';
import 'package:islami/Screens/home/tabs/Radio/tabs/reciters_content_tab.dart';
import 'package:islami/appTheme.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int _currentTabIndex = 0;

  bool isRadioSelected = true;

  bool isRecitersSelected = false;

  List<Widget> tabs = [RadioContentTab(), RecitersContentTab()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.045,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.black.withValues(alpha: 0.7),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _currentTabIndex = 0;
                            setState(() {});
                          },
                          child: TitleItems(
                            isselected: _currentTabIndex == 0,
                            text: 'Radio',
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _currentTabIndex = 1;
                            setState(() {});
                          },
                          child: TitleItems(
                            isselected: _currentTabIndex == 1,
                            text: 'Reciters',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5),

        Expanded(child: tabs[_currentTabIndex]),
      ],
    );
  }
}
