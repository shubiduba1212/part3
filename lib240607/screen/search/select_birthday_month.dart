import 'dart:convert';
import 'dart:math';
import 'package:chap04_flutter_api/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectedBirthdayMonthPage(selectedBirthdayMonth: 'February'),
    );
  }
}

class SelectedBirthdayMonthPage extends StatefulWidget {
  final String selectedBirthdayMonth; // 선택된 생일 월을 저장할 변수

  const SelectedBirthdayMonthPage(
      {Key? key, required this.selectedBirthdayMonth})
      : super(key: key);

  @override
  State<SelectedBirthdayMonthPage> createState() =>
      _SelectedBirthdayMonthPageState();
}

class _SelectedBirthdayMonthPageState extends State<SelectedBirthdayMonthPage> {
  List<Map<String, dynamic>> villagers = []; // 사진 URL, 성별, 종족, 이름을 저장할 리스트
  final List<Color> containerColors = [
    yellow,
    pink,
    Colors.deepOrangeAccent,
    Colors.lime,
    Colors.teal
  ];
  int colorIndex = 0;

  @override
  void initState() {
    super.initState();
    // 앱이 시작될 때 바로 데이터 가져오기
    getVillagersByBirthdayMonth(widget.selectedBirthdayMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: mainGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/search/logo.png'),
            SizedBox(width: 10),
            Text(
              'SOOPCHIVE',
              style:
                  TextStyle(fontSize: 20, fontFamily: 'Monggle', color: yellow),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20), // 정보 칸 사이의 간격을 설정
        child: Center(
          child: villagers.isEmpty
              ? const Text(
                  '잠시만 기다려주세요.',
                  style: TextStyle(fontSize: 24, fontFamily: 'Monggle'),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  itemCount: villagers.length,
                  itemBuilder: (context, index) {
                    // 지정한 색깔별로 순차적으로 지정
                    final Color selectedColor =
                        containerColors[colorIndex % containerColors.length];
                    colorIndex++;

                    return Container(
                      height: 180, // 정보 칸의 높이 설정
                      margin: const EdgeInsets.only(
                          bottom: 20), // 각 정보 칸 사이의 간격을 설정
                      decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            // 원 모양의 배경에 이미지를 넣기 위해 ClipOval 사용
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ClipOval(
                                child: Container(
                                  color: Colors.white,
                                  width: 120,
                                  height: 120,
                                  child: Image.network(
                                    villagers[index]['image_url'],
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10), // 이미지와 텍스트 사이의 간격
                            // 텍스트 정보 표시
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '이름 : ${villagers[index]['name']}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Monggle',
                                      fontSize: 20),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  '성별 : ${villagers[index]['gender'] == 'Male' ? '♂' : '♀'}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Monggle',
                                      fontSize: 16),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  '종족 : ${villagers[index]['species']}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Monggle',
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Future<void> getVillagersByBirthdayMonth(String birthdayMonth) async {
    var url = 'https://api.nookipedia.com/villagers';
    var response = await http.get(
      Uri.parse(url),
      headers: {"X-API-KEY": "1e12770e-930f-4f94-8bf2-7dd37587e30b"},
    );

    if (response.statusCode == 200) {
      var dataConvertedToJSON = json.decode(response.body);
      List<dynamic> villagers = dataConvertedToJSON;

      // 생일 월이 지정된 생일 월인 데이터만 필터링하여 가져오기
      List<Map<String, dynamic>> selectedBirthdayMonthVillagers = [];
      for (var villager in villagers) {
        if (villager['birthday_month'] == birthdayMonth) {
          selectedBirthdayMonthVillagers.add({
            'image_url': villager['image_url'],
            'name': villager['name'],
            'gender': villager['gender'],
            'species': villager['species'],
          });
        }
      }

      // 선택된 생일 월의 주민 데이터를 표시할 수 있도록 설정
      setState(() {
        this.villagers = selectedBirthdayMonthVillagers;
      });
    } else {
      // API 호출 실패 처리
      print('API 호출에 실패했음');
    }
  }
}
