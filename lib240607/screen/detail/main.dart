import 'package:chap04_flutter_api/screen/detail/detailMain.dart';
import 'package:chap04_flutter_api/screen/detail/page1.dart';
import 'package:chap04_flutter_api/screen/detail/page2.dart';
import 'package:chap04_flutter_api/screen/detail/page3.dart';
import 'package:chap04_flutter_api/screen/favorites/main.dart';
import 'package:chap04_flutter_api/screen/mainpage/main.dart';
import 'package:chap04_flutter_api/screen/onboarding/onboarding.dart';
import 'package:chap04_flutter_api/screen/search/main.dart';
import 'package:chap04_flutter_api/screen/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Soopchive());
  // runApp(const DetailMain());
}

class Soopchive extends StatelessWidget {
  const Soopchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/splash',
        initialRoute: '/',
        routes: {
          // '/':(context) => SplashScreen(),
          '/': (context) => MainWidget(),
          '/splash': (context) => SplashScreen(),
          '/onBoarding': (context) => OnBoardingPage(),
          '/search': (context) => SearchMainPage(),
          '/horoscope': (context) => Page2(),
          '/favorites': (context) => MyApp(),
        });
  }
}
