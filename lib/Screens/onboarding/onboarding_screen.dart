import 'package:flutter/material.dart';
import 'package:islami/Screens/onboarding/onboarding.dart';
import 'package:islami/appTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Image.asset(
              'assets/images/header.png',
              height: MediaQuery.of(context).size.height * 0.17,
            ),
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              controller: _controller,
              itemCount: onBoarding.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        onBoarding.images[index],
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),

                      Text(
                        onBoarding.titles[index],
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),

                      Text(
                        onBoarding.subtitles[index],
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppTheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: AppTheme.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _currentPage == 0
                ? SizedBox(width: MediaQuery.sizeOf(context).width * 0.2,)
                : TextButton(
                  onPressed: () {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    'Back',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),

            SmoothPageIndicator(
              controller: _controller,
              count: onBoarding.images.length,
              effect: ExpandingDotsEffect(
                dotColor: Color(0xFF707070),
                activeDotColor: AppTheme.primary,
                dotHeight: 7,
                dotWidth: 7,
              ),
              onDotClicked: (index) => _controller.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
            ),

            _currentPage == onBoarding.images.length - 1
                ? TextButton(
                    onPressed: () async{
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('showHome', true);
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text(
                      'Finish',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                );
              },
              child: Text(
                'Next',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
