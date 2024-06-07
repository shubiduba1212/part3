// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HttpApp(),
//     );
//   }
// }
//
// class HttpApp extends StatefulWidget {
//   const HttpApp({super.key});
//
//   @override
//   State<HttpApp> createState() => _HttpAppState();
// }
//
// class _HttpAppState extends State<HttpApp> {
//   String result = ""; // 검색 결과를 저장할 변수
//   List? data; // null 이 가능 하게 검색 결과 데이터를 저장할 리스트
//   TextEditingController? _editingController;
//
//   @override
//   void initState() {
//
//     super.initState();
//     data = new List.empty(growable: true); // 동적으로 크기 변경 가능 하게 초기화
//     // _editingController = new TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: TextField(
//       //     controller: _editingController,
//       //     style: TextStyle(color: Colors.black),
//       //     keyboardType: TextInputType.text,
//       //     decoration: InputDecoration(hintText: '검색어를 입력하세요'),
//       //   ),
//       // ),
//       body: Container(
//         child: Center(
//             child: data!.length == 0
//                 ? Text('데이터가 없습니다.',
//                     style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
//                 : ListView.builder(
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: Container(
//                           child: Column(
//                             children: <Widget>[
//                               Text(data![index]['name'].toString()),
//                               Image.network(
//                                 data![index]['image_url'],
//                                 alignment: Alignment.topLeft,
//                                 height: 50,
//                                 width: 50,
//                               ),
//                               // Text(data![index]['id'].toString()),
//                               // Image.network(
//                               //   data![index]['thumbnail'],
//                               //   height: 100,
//                               //   width: 100,
//                               //   fit: BoxFit.contain,
//                               // )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: data!.length,
//                   )),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           getJSONData();
//           data!.clear();
//         },
//         child: Icon(Icons.file_download),
//       ),
//     );
//   }
//
//   Future<String> getJSONData() async {
//     var url = 'https://api.nookipedia.com/villagers';
//     var response = await http.get(Uri.parse(url),
//         headers: {"X-API-KEY": "1e12770e-930f-4f94-8bf2-7dd37587e30b"});
//     print(response.body);
//
//     setState(() {
//       var dataConvertedToJSON = json.decode(response.body);
//       List result = dataConvertedToJSON;
//       // (!) : null 확인 연산자 = null이 아닌걸 검증
//       data!.addAll(result); // 기존 데이터에 새로운 결과 추가
//     });
//     return response.body;
//   }
// }

import 'package:flutter/material.dart';
import 'onboarding.dart'; // onboarding.dart import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Main Screen',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const OnBoardingPage()),
              );
            },
            child: const Text('Go to OnBoarding Screen'),
          ),
        ]),
      ),
    );
  }
}
