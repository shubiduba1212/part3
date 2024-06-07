import 'dart:async';

import 'package:chap04_flutter_api/const/colors.dart';
import 'package:chap04_flutter_api/screen/mainpage/main.dart';
import 'package:flutter/material.dart';
// 온보딩 스크린 외부 패키지 임포트(https://pub.dev/packages/introduction_screen/install)
import "package:introduction_screen/introduction_screen.dart";
// import 'package:testflutter/main.dart';

import 'main.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  static bool fistPage = true;

  @override
  void initState() {
    Timer(Duration(milliseconds: 3000), () {
      setState(() {
        fistPage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    final introKey = GlobalKey<IntroductionScreenState>();
    return fistPage == false
        ? IntroductionScreen(
            key: introKey,
            globalBackgroundColor: bg,
            pages: [
              // PageViewModel(
              //   // 첫번째 페이지
              //   title: '',
              //   body: '',
              //   image: Image.asset(
              //     'assets/images/ACNH2.png',
              //     fit: BoxFit.cover,
              //     width: double.infinity,
              //   ),
              //   decoration: PageDecoration(
              //     imageFlex: 45,
              //     // 다른 위젯과 이미지가 겹치는 현상 해결
              //     imagePadding: EdgeInsets.zero,
              //   ),
              // ),
              PageViewModel(
                //두번째 페이지
                title: '',
                bodyWidget: Column(
                  children: [
                    Image.asset(
                      'assets/images/camp.png',
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      '여러분들과 함께 하는\n주민 캐릭터가 궁금 하세요?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'beomseok',
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: black),
                    ),
                    SizedBox(height: 30.0), // 공간을 띄워줌
                    Image.asset('assets/images/search.png'),
                    SizedBox(height: 30.0),
                    Text(
                      '검색 기능을 통해\n주민 캐릭터를 살펴 보세요!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'beomseok',
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: black),
                    ),
                    SizedBox(height: 30.0),
                    Image.asset('assets/images/searchvalue.png')
                  ],
                ),
              ),
              PageViewModel(
                // 세번째 페이지
                title: '',
                bodyWidget: Column(
                  children: [
                    Text(
                      '관심 있는 주민을\n`즐겨찾기`에 추가할 수 있어요!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'beomseok',
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: black),
                    ),
                    SizedBox(height: 40.0),
                    Image.asset(
                      'assets/images/favorite.png',
                      width: double.infinity,
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      '`즐겨찾기`를 통해\n관심있는 주민을 바로 확인 하세요!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'beomseok',
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: black),
                    ),
                    SizedBox(height: 40.0), // 공간을 띄워줌
                    Image.asset('assets/images/favoriteS.png'),
                    SizedBox(height: 10.0),
                  ],
                ),
                decoration: PageDecoration(
                  imagePadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 100),
                  bodyPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                ),
              ),
              PageViewModel(
                // 네번째 페이지
                title: '',
                bodyWidget: Column(
                  children: [
                    Text(
                      '주민들의 별자리를\n살펴볼 수 있어요',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'beomseok',
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: black),
                    ),
                    SizedBox(height: 40.0),
                    Image.asset('assets/images/personality1.png'),
                    Image.asset('assets/images/personality2.png'),
                    SizedBox(height: 40.0),
                    Text(
                      '관심있는 주민의 별자리가\n무엇인지 바로 확인 하세요!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'beomseok',
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: black),
                    ),
                    SizedBox(height: 40.0),
                  ],
                ),
                decoration: PageDecoration(
                  imagePadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 100),
                  bodyPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                ),
              ),
            ],

            done: Image.asset(
              'assets/images/start.png',
            ),
            // ElevatedButton(
            //   onPressed: () => {
            //     Navigator.of(context).pop(controller.value.text),
            //   },
            //   style: FilledButton.styleFrom(
            //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //       backgroundColor: mainGreen,
            //       shadowColor: darkGreen,
            //       elevation: 2.0,
            //       foregroundColor: white),
            //   child: Text(
            //     '시작하기',
            //     style: TextStyle(fontSize: 15),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            onDone: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MainWidget()),
              );
            },
            // next = 다음 페이지로 이동
            next: Image.asset(
              'assets/images/next.png',
            ),
            // ElevatedButton(
            //   onPressed: () => {introKey.currentState?.next()},
            //   style: FilledButton.styleFrom(
            //       padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            //       backgroundColor: mainGreen,
            //       shadowColor: darkGreen,
            //       elevation: 5.0,
            //       foregroundColor: white),
            //   child: Text(
            //     '다음',
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            // showBackButton: true,
            back: const Icon(Icons.arrow_back_ios),
            showSkipButton: true,
            skip: Image.asset('assets/images/skip.png'),
            // skip: ElevatedButton(
            //   onPressed: () => {introKey.currentState?.animateScroll(3)},
            //   style: FilledButton.styleFrom(
            //       padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            //       backgroundColor: yellow,
            //       shadowColor: brown,
            //       elevation: 5.0,
            //       foregroundColor: white),
            //   child: Text(
            //     '건너 뛰기',
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            dotsDecorator: DotsDecorator(
              color: const Color.fromARGB(255, 137, 192, 139),
              activeColor: const Color.fromARGB(255, 0, 121, 4),
              size: const Size(10, 10),
              activeSize: Size(15, 15),
              spacing: EdgeInsets.all(10),
              activeShape: // shape 및 round 설정
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
            ),
            curve: Curves.linear, // 넘김 애니메이션 속성
          )
        : Container(
            child: Image.asset(
              'assets/images/ACNH2.png',
              fit: BoxFit.cover,
            ),
          );
  }
}
