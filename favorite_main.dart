import 'dart:convert';
import 'package:chap04_flutter_api/screen/detail/favoriteVillager.dart';
import 'package:chap04_flutter_api/widget/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../const/colors.dart';
import '../detail/detailMain.dart';
// import '../detail/main.dart';
import 'package:chap04_flutter_api/widget/navigationbar.dart';
import 'package:chap04_flutter_api/screen/detail/globalFavoriteList.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  int get currentPageIndex => 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MainAppBar(),
        body: const VillagersListScreen(),
        backgroundColor: const Color(0xFFFBFCD5),
        bottomNavigationBar: bottomNavigator(context, currentPageIndex),
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
  List<String> villagerNames = [];
  // List<String> villagerNames = ['Apple'];
  bool isLoading = true;
  String errorMessage = '';
  List<FavoriteVillager>? favoriteList = globals.globalList; // 즐겨찾기 리스트 가져오기
  int get currentPageIndex => 3;

  @override
  void initState() {
    super.initState();
    //_loadVillagerNames(); // 저장된 주민 이름 목록 불러오기
    fetchVillagers(); // API로부터 주민 데이터 불러오기
    List<FavoriteVillager>? favoriteList = globals.globalList;
    if(favoriteList != null){
      for(var i = 0; i < favoriteList.length; i++){
          villagerNames.add(favoriteList[i].villagerName!);
          print("current added villagerName : ${favoriteList[i].villagerName!}");
      }
    }
  }

  // API로부터 주민 데이터를 불러오는 함수
  Future<void> fetchVillagers() async {
    const apiKey =
        '1e12770e-930f-4f94-8bf2-7dd37587e30b'; // Replace with your actual API key

    try {
      final response = await http.get(
        Uri.parse('https://api.nookipedia.com/villagers'),
        headers: {
          'X-API-KEY': apiKey,
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
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error fetching villagers: $e';
      });
      print('Error fetching villagers: $e');
    }
  }

  // // SharedPreferences에서 저장된 주민 이름 목록 불러오기
  // Future<void> _loadVillagerNames() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     villagerNames = prefs.getStringList('villagerNames') ?? [];
  //   });
  // }
  //
  // // 주민 이름 목록을 SharedPreferences에 저장
  // void _saveVillagerNames() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setStringList('villagerNames', villagerNames);
  // }
  // // 주민 목록에서 이름을 제거하는 함수
  // void removeVillager(int index) {
  //   setState(() {
  //     villagerNames.removeAt(index);
  //   });
  //   _saveVillagerNames();
  // }

  // 주민 목록에서 이름을 제거하는 함수
  void removeVillager(int index) {
    setState(() {
      FavoriteVillager newVillager = FavoriteVillager(villagerName: villagerNames[index]);
      villagerNames.removeAt(index); // 즐겨찾기페이지 목록에서 해당 항목 삭제
      globals.globalList?.remove(newVillager);
      globals.globalList = [
        ...globals.globalList ?? []
      ];
      for(FavoriteVillager villager in globals.globalList!){
        print("villager left in list : ${villager.villagerName}");
      }
      print(
          "globals.globalList length after removed : ${globals.globalList?.length}");
    });
  }
  // void removeVillager(int index) {
  //   setState(() {
  //     villagerNames.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        backgroundColor: const Color(0xFFFBFCD5),
        bottomNavigationBar: bottomNavigator(context, currentPageIndex),
        body: isLoading == true ? const Center(child: CircularProgressIndicator()) : villagerNames.isEmpty == true ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 120,
                backgroundColor: bg,
                child: Image.network('https://soopool.art/img/infoac/NPC/Tom_Nook/Tom_Nook.png',
                  height: 300,
                ),
              ),
              SizedBox(height: 40,),
              Text(
                '즐겨찾기 등록된 주민이 없어요⭐\n검색을 통해 추가해주세요!',
                style: TextStyle(fontSize: 24.0, fontFamily: 'Monggle', color: mainGreen),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ) : ListView.builder(
    itemCount: villagerNames.length,
    itemBuilder: (context, index) {
    String villagerName = villagerNames[index];
    var villager = villagers.firstWhere(
    (villager) => villager['name'] == villagerName,
    orElse: () => null,
    );

    String titleColor =
    villager != null ? villager['title_color'] ?? '000000' : '000000';

    return VillagerTile(
    villager: villager,
    titleColor: titleColor,
    onRemove: () => removeVillager(index),
    );
    },
    )
    );

    // if (errorMessage.isNotEmpty) {
    //   return Center(child: Text(errorMessage));
    // }
    //
    // if (villagerNames.isEmpty) {
    //   return Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         CircleAvatar(
    //           radius: 120,
    //           backgroundColor: bg,
    //           child: Image.network('https://soopool.art/img/infoac/NPC/Tom_Nook/Tom_Nook.png',
    //             height: 300,
    //           ),
    //         ),
    //         SizedBox(height: 40,),
    //         Text(
    //           '즐겨찾기 등록된 주민이 없어요⭐\n검색을 통해 추가해주세요!',
    //           style: TextStyle(fontSize: 24.0, fontFamily: 'Monggle', color: mainGreen),
    //           textAlign: TextAlign.center,
    //         ),
    //       ],
    //     ),
    //   );
    // },
    //
    //
    //
    // return ListView.builder(
    //   itemCount: villagerNames.length,
    //   itemBuilder: (context, index) {
    //     String villagerName = villagerNames[index];
    //     var villager = villagers.firstWhere(
    //       (villager) => villager['name'] == villagerName,
    //       orElse: () => null,
    //     );
    //
    //     String titleColor =
    //         villager != null ? villager['title_color'] ?? '000000' : '000000';
    //
    //     return VillagerTile(
    //       villager: villager,
    //       titleColor: titleColor,
    //       onRemove: () => removeVillager(index),
    //     );
    //   },
    // );
  }
}

// VillagerTile: StatefulWidget으로 각각의 주민 정보를 표시
class VillagerTile extends StatefulWidget {
  final dynamic villager;
  final String titleColor;
  final VoidCallback onRemove;

  const VillagerTile({
    Key? key,
    required this.villager,
    required this.titleColor,
    required this.onRemove,
  }) : super(key: key);

  @override
  _VillagerTileState createState() => _VillagerTileState();
}

class _VillagerTileState extends State<VillagerTile> {
  bool isImageWhite = false;

  void toggleImageColor() {
    setState(() {
      isImageWhite = !isImageWhite;
      if (isImageWhite) {
        widget.onRemove();
      }
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
                    builder: (context) => DetailMain(selectedName: widget.villager['name']),
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
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        width: 30,
                        height: 30,
                        child: Image.network(widget.villager != null
                            ? widget.villager['image_url']
                            : 'https://example.com/placeholder_image.png'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 200),
                            child: Text(
                              widget.villager != null
                                  ? widget.villager['name']
                                  : 'Unknown',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
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
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
