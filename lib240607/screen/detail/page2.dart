import 'package:chap04_flutter_api/widget/navigationbar.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 현재 페이지 index
    int currentPageIndex = 2;

    return Scaffold(
      bottomNavigationBar: bottomNavigator(context, currentPageIndex),
      body: Center(
        child: Text('page2'),
      ),
    );
  }
}