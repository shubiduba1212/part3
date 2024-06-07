import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'SOOPCHIVE',
            style: TextStyle(color: Color(0xFFFFB800), fontFamily: 'Monggle'),
          ),
          backgroundColor: Color(0xFF00A059),
          centerTitle: true,
        ),
        body: VillagersListScreen(),
        backgroundColor: Color(0xFFFBFCD5),
      ),
    );
  }
}

class VillagersListScreen extends StatefulWidget {
  const VillagersListScreen({Key? key}) : super(key: key);

  @override
  _VillagersListScreenState createState() => _VillagersListScreenState();
}

class _VillagersListScreenState extends State<VillagersListScreen> {
  List<dynamic> villagers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchVillagers();
  }

  Future<void> fetchVillagers() async {
    final response = await http.get(
      Uri.parse('https://api.nookipedia.com/villagers'),
      headers: {
        'X-API-KEY': '1e12770e-930f-4f94-8bf2-7dd37587e30b', // 실제 API 키로 변경
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        villagers = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load villagers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: villagers.length,
            itemBuilder: (context, index) {
              String titleColor = villagers[index]['title_color'] ?? 'black';
              return VillagerTile(
                villager: villagers[index],
                titleColor: titleColor,
              );
            },
          );
  }
}

class VillagerTile extends StatefulWidget {
  final dynamic villager;
  final String titleColor;

  const VillagerTile({
    Key? key,
    required this.villager,
    required this.titleColor,
  }) : super(key: key);

  @override
  _VillagerTileState createState() => _VillagerTileState();
}

class _VillagerTileState extends State<VillagerTile> {
  bool isImageWhite = false;

  void toggleImageColor() {
    setState(() {
      isImageWhite = !isImageWhite;
    });
  }

  @override
  Widget build(BuildContext context) {
    String modifiedTitleColor = widget.titleColor.toLowerCase() == 'ffffff'
        ? '800080' // Purple color
        : widget.titleColor;

    return ListTile(
      title: Row(
        children: [
          GestureDetector(
              onTap: () {
                if (!isImageWhite) {
                  // Navigate to detail page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(villager: widget.villager),
                    ),
                  );
                }
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  alignment: Alignment.center,
                  width: 370,
                  height: 51,
                  decoration: BoxDecoration(
                    color: Color(int.parse('0xFF$modifiedTitleColor')),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(int.parse('0xFF$modifiedTitleColor'))
                            .withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Container(
                          width:
                              30, // Set the width and height smaller than the box decoration
                          height: 30,
                          child: Image.network(widget.villager['image_url']),
                        ),
                        SizedBox(width: 10), // 이미지와 텍스트 사이의 간격을 줄임
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 200), // 텍스트를 왼쪽으로 조금 이동
                              child: Text(
                                widget.villager['name'],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  // color: Color(0xFFFFFFFF),
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Ensure the text doesn't overflow
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: toggleImageColor,
                          child: Image.asset(
                            'assets/images/pngwing 1.png',
                            height: 30,
                            color: isImageWhite ? Colors.white : null,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final dynamic villager;

  const DetailPage({Key? key, required this.villager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text(villager['name']),
      ),
    );
  }
}
