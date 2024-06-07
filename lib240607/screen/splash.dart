import 'dart:async';
import 'package:chap04_flutter_api/const/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onBoarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: mainGreen,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'SOOPCHIVE',
                  style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Monggle',
                      fontWeight: FontWeight.w700,
                      color: yellow),
                ),
                SizedBox(
                  height: 50.0,
                ),
                CircularProgressIndicator(
                  color: yellow,
                  backgroundColor: mainGreen,
                  strokeWidth: 2,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
