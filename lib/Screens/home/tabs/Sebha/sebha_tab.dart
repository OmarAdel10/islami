import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/sebha/cubit/sebha_cubit.dart';
import 'package:islami/features/sebha/cubit/sebha_state.dart';

final List<String> sebhaTexts = [
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
  'لا إلهَ إلّا أنتَ، سُبحانَكَ، إنّي كُنتُ مِنَ الظّالِمينَ',
  'أستغفِرُ اللهَ الذي لا إلهَ إلّا هوَ، الحَيُّ القَيّومُ، وأتوبُ إلَيْهِ',
  'لا إلهَ إلّا اللهُ، وَحدَهُ لا شَريكَ لهُ، لهُ المُلك ولهُ الحمد، وهوَ على كُلِّ شَيءٍ قديرٌ',
  'قُلْ هوَ اللهُ أحدٌ، اللهُ الصَّمد، لمْ يَلِدْ ولمْ يُولَدْ، ولمْ يَكُنْ لهُ كُفُوًا أحدٌ',
  'اللّهُمَّ اجعلْني مِنَ المُتَوَكِّلينَ عليكَ، والمُخلصينَ في عبادتِكَ',
  'اللّهُمَّ اجعلْني مِنَ الصّابِرينَ الشّاكِرينَ، وارزُقني رِضاكَ والجَنّةَ',
  'اللّهُمَّ اجعلْني مِنَ المُحِبِّينَ لِكلامكَ، والمُتَدَبِّرينَ في آياتكَ',
  'اللّهُمَّ اجعلْني مِنَ المُتَواضِعينَ لِعَظَمَتكَ، والمُستَغفِرينَ لِذُنوبِي',
  'اللّهُمَّ اجعلْني مِنَ المُخلصينَ في عبادتكَ، والمُتَوَكِّلينَ عليكَ',
  'سبحان الله والحمد لله ولا إله إلا الله والله أكبر',
  'اللّهُمَّ اجعلْني مِنَ المُتَوَكِّلينَ عليكَ، والمُخلصينَ في عبادتكَ',
];

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SebhaCubit(),
      child: const _SebhaTabView(),
    );
  }
}

class _SebhaTabView extends StatefulWidget {
  const _SebhaTabView();

  @override
  State<_SebhaTabView> createState() => _SebhaTabViewState();
}

class _SebhaTabViewState extends State<_SebhaTabView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation<double>? _rotationAnimation;
  double _lastRotationEnd = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateTo(double begin, double end) {
    _rotationAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SebhaCubit, SebhaState>(
      builder: (context, state) {
        if (state.rotationEnd != _lastRotationEnd) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _animateTo(state.rotationBegin, state.rotationEnd);
              _lastRotationEnd = state.rotationEnd;
            }
          });
        }

        return Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.14),
            Center(
              child: GestureDetector(
                onTap: () {
                  context.read<SebhaCubit>().incrementTasbeeh();
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -80,
                        left:
                            (MediaQuery.of(context).size.width * 0.9) / 2 -
                            86 / 5,
                        child: Image.asset(
                          'assets/images/sebha_head.png',
                          width: 86,
                        ),
                      ),
                      AnimatedBuilder(
                        animation:
                            _rotationAnimation ??
                            Tween<double>(begin: 0, end: 0).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: Curves.easeInOut,
                              ),
                            ),
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _rotationAnimation?.value ?? 0.0,
                            child: child,
                          );
                        },
                        child: Image.asset('assets/images/sebha_body.png'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AutoSizeText(
                              sebhaTexts[state.sebhaIndex],
                              style: Theme.of(context).textTheme.displaySmall,
                              textAlign: TextAlign.center,
                              minFontSize: 21,
                              maxLines: 3,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${state.counter}',
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
      },
    );
  }
}
