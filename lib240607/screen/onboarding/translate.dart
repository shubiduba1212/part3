import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  const HttpApp({super.key});

  @override
  State<HttpApp> createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = ""; // 검색 결과를 저장할 변수
  List? data; // null이 가능하게 검색 결과 데이터를 저장할 리스트
  TextEditingController? _editingController;

  @override
  void initState() {
    super.initState();
    data = []; // 빈 리스트로 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: data!.isEmpty
              ? Text('에러라니.',
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(data![index]['name'].toString()),
                            Text(data![index]['species'].toString()),
                            // Image.network(
                            //   data![index]['image_url'],
                            //   // alignment: Alignment.topLeft,
                            //   height: 50,
                            //   width: 50,
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: data!.length,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
          // data!.clear();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<void> getJSONData() async {
    var url = 'https://api.nookipedia.com/villagers';
    var response = await http.get(Uri.parse(url),
        headers: {"X-API-KEY": "1e12770e-930f-4f94-8bf2-7dd37587e30b"});

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      // 이름을 번역합니다.
      final translator = GoogleTranslator();
      for (var villager in data) {
        var translatedName =
            await translator.translate(villager['name'], from: 'en', to: 'ko');
        villager['name'] = translatedName.text;
        // print(translatedName);
      }

      setState(() {
        this.data!.addAll(data);
      });
    } else {
      throw Exception('Failed to load villagers');
    }
  }
}
