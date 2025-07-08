import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/appTheme.dart';
import 'package:islami/widgets/loading_indicator.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = '/suraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  // i don't understand this dynamic very well but the code wouldn't run without it and the IDE told me in the exception that i should type dynamic
  late final dynamic args;

  late final int index;

  List<String> ayat = [];

  bool hasInit = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.sizeOf(context);
    if (!hasInit) {
      args = ModalRoute.of(context)!.settings.arguments as Map;
      index = args['index'];
      hasInit = true;
      if (ayat.isEmpty) {
        loadSura();
      }
    }
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

          Expanded(
            child:
                mergedAyat.isEmpty
                    ? LoadingIndicator()
                    : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        mergedAyat,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: AppTheme.primary,
                          height: 2,
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
          ),

          // Expanded(
          //   child:
          //       ayat.isEmpty
          //           ? LoadingIndicator()
          //           : ListView.separated(
          //             padding: EdgeInsets.symmetric(horizontal: 20),
          //             itemBuilder:
          //                 (_, indexx) => Text(
          //                   ayat[indexx],
          //                   style: theme.textTheme.titleLarge!.copyWith(
          //                     color: AppTheme.primary,
          //                   ),
          //                   textAlign: TextAlign.center,
          //                 ),
          //             separatorBuilder: (_, __) => SizedBox(height: 12),
          //             itemCount: ayat.length,
          //           ),
          // ),
          SizedBox(height: 20),

          Image.asset(
            'assets/images/sura_details_footer.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  String mergedAyat = '';

  Future<void> loadSura() async {
    final SuraAyatContent = await rootBundle.loadString(
      'assets/text/${index + 1}.txt',
    );

    final rawAyat = SuraAyatContent.split('\r\n');

    for (int i = 0; i < rawAyat.length; i++) {
      mergedAyat += '${rawAyat[i]} \uFD3F${i + 1}\uFD3E ';
    }

    setState(() {});
  }

  // Future<void> loadSura() async {
  //   String SuraAyatContent = await rootBundle.loadString(
  //     'assets/text/${index + 1}.txt',
  //   );
  //   ayat = SuraAyatContent.split('\r\n');
  //   setState(() {});
  // }
}
