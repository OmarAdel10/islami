import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  List<String> sebhaTexts = [
    'سُبحانَ اللهِ',
    'الحمدُ لله',
    'لا إلهَ إلّا اللهُ',
    'أستغفِرُ اللهَ',
    'رَبِّ اغفِرْ لي',
    'اللهُ أكبرُ',
    'لا حولَ ولا قوّةَ إلّا بالله',
    'اللّهُمَّ صَلِّ وسَلِّمْ وبارِكْ على سيّدِنا محمّدٍ',
    'اللّهمَّ إنّكَ عَفُوٌّ كَريمٌ تُحِبُّ العَفْوَ فَاعْفُ عنّي',
    'سُبحانَ اللهِ وبِحَمدِهِ، سُبحانَ اللهِ العَظيمِ',
    'اللهُ أكبرُ كبيرًا، والحمدُ للهِ كثيرًا، وسُبحانَ اللهِ بُكرةً وأصيلً',
    'اللّهُمَّ اغفِرْ لي ذَنْبي كُلَّهُ، دِقَّهُ وجِلَّهُ، وأوّلَهُ وآخِرَهُ',
    'لا إلهَ إلّا أنتَ، سُبحانَكَ، إنّي كنتُ مِنَ الظّالِمينَ',
    'أستغفِرُ اللهَ الذي لا إلهَ إلّا هوَ، الحَيُّ القَيّومُ، وأتوبُ إلَيْهِ',
    'لا إلهَ إلّا اللهُ، وَحدَهُ لا شَريكَ لهُ، لهُ المُلكُ ولهُ الحمدُ، وهوَ على كُلِّ شَيءٍ قديرٌ',
    'قُلْ هوَ اللهُ أحدٌ، اللهُ الصَّمدُ، لمْ يَلِدْ ولمْ يُولَدْ، ولمْ يَكُنْ لهُ كُفُوًا أحدٌ',
    'اللّهُمَّ اجعلْني مِنَ المُتَوَكِّلينَ عليكَ، والمُخلصينَ في عبادتِكَ',
    'اللّهُمَّ اجعلْني مِنَ الصّابِرينَ الشّاكِرينَ، وارزُقْني رِضاكَ والجَنّةَ',
    'سُبحانَ اللهِ وبِحَمدِهِ، عددَ خَلْقِهِ، ورِضا نَفسِهِ، وزِنةَ عَرشِهِ، ومِدادَ كَلِماتِهِ',
    'اللّهُمَّ اجعلْني مِنَ أهلِ الذِّكرِ والشُّكرِ، وارزُقْني حُسنَ الخاتِمةِ',
    'اللّهُمَّ اجعلْني مِنَ المُحِبِّينَ لِكلامِكَ، والمُتَدَبِّرينَ في آياتِكَ',
    'اللّهُمَّ اجعلْني مِنَ المُتَواضِعينَ لِعَظَمَتِكَ، والمُستَغفِرينَ لِذُنوبِي',
    'اللّهُمَّ اجعلْني مِنَ المُخلصينَ في عبادتِكَ، والمُتَوَكِّلينَ عليكَ',
    'سبحان الله والحمد لله ولا إله إلا الله والله أكبر',
    'اللّهُمَّ اجعلْني مِنَ المُتَوَكِّلينَ عليكَ، والمُخلصينَ في عبادتِكَ',
  ];

  int counter = 0;
  int sebhaIndex = 0;
  int sebhaCount = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        SizedBox(height: size.height * 0.025),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(height: size.height * 0.14),
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                sebhaCount++;
                counter++;
                if (sebhaCount == 33) {
                  sebhaCount = 0;
                  sebhaIndex = (sebhaIndex + 1) % sebhaTexts.length;
                }
              });
            },
            child: SizedBox(
              width: size.width * 0.9,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -80,
                    left: (size.width * 0.9) / 2 - 86 / 5,
                    child: Image.asset(
                      'assets/images/sebha_head.png',
                      width: 86,
                    ),
                  ),
                  Image.asset('assets/images/sebha_body.png'),
                  SizedBox(
                    width: size.width * 0.55,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutoSizeText(
                          sebhaTexts[sebhaIndex],
                          style: Theme.of(context).textTheme.displaySmall,
                          textAlign: TextAlign.center,
                          minFontSize: 21,
                          maxLines: 3,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '$counter',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
