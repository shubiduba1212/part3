import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../const/colors.dart';

class SearchNamePage extends StatefulWidget {
  final String? searchText;

  SearchNamePage(this.searchText);

  @override
  _SearchNamePageState createState() => _SearchNamePageState();
}

class _SearchNamePageState extends State<SearchNamePage> {
  final List<Color> containerColors = [
    yellow,
    pink,
    Colors.deepOrangeAccent,
    Colors.lime,
    Colors.teal
  ];
  int colorIndex = 0;

  List<Map<String, dynamic>> villagers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getVillagersByName(widget.searchText);
  }

  Future<void> getVillagersByName(String? name) async {
    var url = 'https://api.nookipedia.com/villagers';
    var response = await http.get(
      Uri.parse(url),
      headers: {"X-API-KEY": "1e12770e-930f-4f94-8bf2-7dd37587e30b"},
    );

    if (response.statusCode == 200) {
      var dataConvertedToJSON = json.decode(response.body);
      List<dynamic> villagersList = dataConvertedToJSON;

      List<Map<String, dynamic>> matchedVillagers = [];
      for (var villager in villagersList) {
        if (villager['name'].toLowerCase().contains(name!.toLowerCase())) {
          matchedVillagers.add({
            'image_url': villager['image_url'],
            'name': villager['name'],
            'gender': villager['gender'],
            'species': villager['species'],
          });
        }
      }
      setState(() {
        villagers = matchedVillagers;
        isLoading = false;
      });
    } else {
      throw Exception('API 호출에 실패했습니다');
    }
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : villagers.isEmpty
              ? Center(
                  child: Text(
                    '검색결과가 없습니다.',
                    style: TextStyle(fontSize: 24, fontFamily: 'Monggle'),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: villagers.length,
                    itemBuilder: (context, index) {
                      final Color selectedColor =
                          containerColors[index % containerColors.length];
                      return Container(
                        height: 180,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
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
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '이름 : ${villagers[index]['name']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Monggle',
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    '성별 : ${villagers[index]['gender'] == 'Male' ? '♂' : '♀'}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Monggle',
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    '종족 : ${villagers[index]['species']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Monggle',
                                      fontSize: 20,
                                    ),
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
    );
  }
}
