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
        initialRoute: '/splash',
        // initialRoute: '/',
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

// import 'package:chap04_flutter_api/const/colors.dart';
// import 'package:chap04_flutter_api/screen/detail/page2.dart';
// import 'package:chap04_flutter_api/screen/favorites/main.dart';
// import 'package:chap04_flutter_api/screen/mainpage/main.dart';
// import 'package:chap04_flutter_api/screen/onboarding/onboarding.dart';
// import 'package:chap04_flutter_api/screen/search/main.dart';
// import 'package:chap04_flutter_api/screen/splash.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const Soopchive());
// }
//
// class Soopchive extends StatelessWidget {
//   const Soopchive({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialRoute: '/splash',
//         routes: {
//           '/': (context) => Main(), //메인
//           '/splash': (context) => SplashScreen(),
//           '/onBoarding': (context) => OnBoardingPage(),
//           '/search': (context) => SearchPage(),
//           '/horoscope': (context) => Page2(), // 별자리
//           '/favorites': (context) => MyApp(), // 즐겨찾기
//         });
//   }
// }
// class Sample extends StatelessWidget {
//   const Sample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Container(
//         decoration: BoxDecoration(color: mainGreen),
//         child: Center(
//           child: Column(
//             children: [
//               Text(
//                 '샘플링 ABCDSOOPCHIVEabcd1234',
//                 style: TextStyle(
//                     fontFamily: 'Monggle', fontSize: 50, color: white),
//               ),
//               Text(
//                 '샘플링 ABCDSOOPCHIVEabcd1234',
//                 style: TextStyle(
//                     fontFamily: 'beomseok',
//                     fontSize: 50,
//                     fontWeight: FontWeight.w400,
//                     color: white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
