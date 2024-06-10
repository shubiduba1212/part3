import 'package:chap04_flutter_api/screen/detail/detailMain.dart';
import 'package:chap04_flutter_api/widget/navigationbar.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 현재 페이지 index
    int currentPageIndex = 2;
    String? villagerName = "Ribbot";

    return Scaffold(
      bottomNavigationBar: bottomNavigator(context, currentPageIndex),
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailMain(
                            selectedName: villagerName,
                          )));
            },
            child: Text('page2')),
      ),
    );
  }
}
