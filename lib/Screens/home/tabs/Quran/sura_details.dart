import 'package:flutter/material.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = '/suraDetails';
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.sizeOf(context);
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String suraEnglishName = args['english'];
    final String suraArabicName = args['arabic'];
    return Scaffold(
      appBar: AppBar(title: Text(suraEnglishName)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/sura_details_left.png',
                  height: size.height * 0.1,
                  fit: BoxFit.fill,
                ),
                Text(suraArabicName, style: theme.textTheme.headlineSmall),
                Image.asset(
                  'assets/images/sura_details_right.png',
                  height: size.height * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),

          Spacer(),

          Image.asset(
            'assets/images/sura_details_footer.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
