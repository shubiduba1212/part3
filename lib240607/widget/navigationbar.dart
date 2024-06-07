import 'package:chap04_flutter_api/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget bottomNavigator(BuildContext context, int currentIndex){
  return NavigationBar(
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    indicatorColor: yellow,
    backgroundColor: yellow,
    onDestinationSelected: (int index) {
        currentIndex = index;
        if(index == 0){ // home
          Navigator.of(context).pushReplacementNamed('/');
        }else if(index == 1){ // search
          Navigator.of(context).pushReplacementNamed('/search');
        }else if(index == 2){ // horoscope
          Navigator.of(context).pushReplacementNamed('/horoscope');
        }else if(index == 3){ // favorites
          Navigator.of(context).pushReplacementNamed('/favorites');
        }
    },
    selectedIndex: currentIndex,
    destinations: <Widget>[
      NavigationDestination(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(currentIndex == 0 ? 'assets/images/icon_home_active.png' : 'assets/images/icon_home_inactive.png'), width: 48, height: 48,),
            Text('홈', style: TextStyle(fontFamily: 'Monggle', fontSize: 12, ),)
          ],
        ),
        label: '홈',
      ),
      NavigationDestination(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(currentIndex == 1 ? 'assets/images/icon_search_active.png' : 'assets/images/icon_search_inactive.png'), width: 48, height: 48,),
            Text('검색', style: TextStyle(fontFamily: 'Monggle', fontSize: 12, ),)
          ],
        ),
        label: '검색',
      ),
      NavigationDestination(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(currentIndex == 2 ? 'assets/images/icon_stella_active.png' : 'assets/images/icon_stella_inactive.png'), width: 48, height: 48,),
            Text('별자리', style: TextStyle(fontFamily: 'Monggle', fontSize: 12, color: white),)
          ],
        ),
        label: '',

      ),
      NavigationDestination(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(currentIndex == 3 ? 'assets/images/icon_favorites_active.png' : 'assets/images/icon_favorites_inactive.png'), width: 48, height: 48,),
            Text('즐겨찾기', style: TextStyle(fontFamily: 'Monggle', fontSize: 12, ),)
          ],),
        label: '',
      ),
    ],
  );
}

//   setState(() {
//     currentIndex = index;
//     if(index == 0){ // home
//       Navigator.of(context).popAndPushNamed('/');
//     }else if(index == 1){ // search
//       Navigator.of(context).popAndPushNamed('/search');
//     }else if(index == 2){ // horoscope
//       Navigator.of(context).popAndPushNamed('/horoscope');
//     }else if(index == 3){ // favorites
//       Navigator.of(context).popAndPushNamed('/favorites');
//     }
//   });

// Navigator.push(
//   context,
//   PageRouteBuilder(
//     pageBuilder: (context, animation1, animation2) => ,
//     transitionDuration: Duration.zero,
//     reverseTransitionDuration: Duration.zero,
//   ),
// );


