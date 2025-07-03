import 'package:flutter/material.dart';
import 'package:islami/Screens/home_screen.dart';
import 'package:islami/Screens/onboarding/onboarding_screen.dart';
import 'package:islami/appTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        OnboardingScreen.routeName : (_) => OnboardingScreen(),
      },
      initialRoute: OnboardingScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
