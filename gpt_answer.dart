import 'dart:async';
import 'dart:convert';

import 'package:chap04_flutter_api/const/colors.dart';
import 'package:chap04_flutter_api/screen/detail/page1.dart';
import 'package:chap04_flutter_api/screen/detail/page3.dart' as globals;
import 'package:chap04_flutter_api/widget/navigationbar.dart';
import 'package:chap04_flutter_api/widget/sub_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class DetailMain extends StatefulWidget {
  final String selectedName;
  //final List<FavoriteVillager>? list;
  // final List<FavoriteVillager>? list;
  const DetailMain({Key? key, required this.selectedName})
      // const DetailMain({Key? key, required this.selectedName, this.list})
      : super(key: key);
  //const DetailMain({super.key});
  //required this.selectedName
  // String? selectedName;
  // final String name = villagerName;

  @override
  State<DetailMain> createState() =>
      _DetailMainState(selectedName: selectedName);
  // _DetailMainState(selectedName: selectedName, list: list);
}

class _DetailMainState extends State<DetailMain> {
  // 현재 상세 페이지로 접근한 주민 영어 이름
  late String selectedName; // selectedName 변수 선언
  //late List<FavoriteVillager>? list; // 즐겨찾기 list 변수 선언

  _DetailMainState({required this.selectedName}); // 생성자를 통해 값을 받아옴
  // _DetailMainState({required this.selectedName, this.list}); // 생성자를 통해 값을 받아옴

  //favorite List 즐겨찾기 추가 리스트 기본 설정
  //List<FavoriteVillager> addedVillagerList = new List.empty(growable: true);

  //favorite List 즐겨찾기 기존 리스트 기본 설정
  //List<FavoriteVillager>? favoriteList = widget.list; // 즐겨찾기 기존 리스트 가져오기

  // 현재 페이지 index
  int currentPageIndex = 0;

  //즐겨찾기 버튼 클릭 기본값 설정
  static bool ActivateFavorite = false;

  //주민 상세 설명 활성화
  static bool showDetail = false;

  //api 불러오기 로딩화면 활성화 여부
  static bool hideLoading = false;

  //profile TextStyle
  TextStyle profileTextStyle() {
    return TextStyle(
        fontSize: 16,
        fontFamily: 'beomseok',
        fontWeight: FontWeight.w500,
        color: white);
  }

  // villager Info
  List<dynamic> detailInfo = [];

  // 검색/클릭한 해당 주민의 데이터
  Map<String, dynamic> detailData = {};
  //List<FavoriteVillager>? myList = globals.globalList;
  List<FavoriteVillager>? list = globals.globalList;

  @override
  void initState() {
    super.initState();
    selectedName = widget.selectedName;
    // globals.globalList = widget.list;
    //favorite List 즐겨찾기 추가 리스트 기본 설정
    print("globalList : ${globals.globalList}");
    //list?.add(FavoriteVillager(villagerName: selectedName));
    // addedVillagerList.add(FavoriteVillager(villagerName: selectedName));
    // print("addedVillagerList : ${addedVillagerList[0].villagerName}");
    print("list in initState() : $list");
    print("selectedName in initState() : $selectedName");
    getInfo(selectedName); // 검색/즐겨찾기/별자리로 접근하는 주민 이름
    //getInfo("Apple"); // 검색/즐겨찾기/별자리로 접근하는 주민 이름

    Timer(const Duration(seconds: 7), () {
      setState(() {
        hideLoading = true;
      });
    });
  }

  void dispose() {
    super.dispose();
    hideLoading = false;
    // Timer(const Duration(seconds:5), () {
    //   setState(() {
    //     hideLoading = true;
    //   });
    // });
  }

  Widget profileInfo(double screenWidth, double screenHeight) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              //color: yellow,
              decoration: BoxDecoration(
                  color: Color(int.parse(
                      '0xFF${detailData["title_color"] == null ? "FFB800" : detailData["title_color"]}')),
                  // color: Color("0xFF${detailData["title_color"]}"),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(offset: const Offset(4, 4), color: brown)
                  ]),
              child: Column(
                children: [
                  // Text(result),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Image.asset(
                          ActivateFavorite == false
                              ? 'assets/images/favorites_inactive.png'
                              : 'assets/images/favorites_active.png',
                          width: 30,
                          height: 30,
                        ),
                        onTap: () {
                          // print('추가 전 favoriteList : $list');
                          // list?.add(
                          //     FavoriteVillager(villagerName: selectedName));
                          // print('추가 후 favoriteList : $list');
                          // print(
                          //     '추가 후 favoriteList : ${list == null ? null : list!.length}');
                          globals.globalList?.add(
                              FavoriteVillager(villagerName: selectedName));
                          print(
                              "globals.globalList after removed : ${globals.globalList}");
                          setState(() {
                            ActivateFavorite = !ActivateFavorite;
                            if (ActivateFavorite == false) {
                              print("inactivate favorite");
                              //list!.remove(FavoriteVillager(villagerName: selectedName));
                              list?.removeLast();
                              print("list after removed : $list");
                            } else {
                              print("activate favorite");
                              list?.add(
                                  FavoriteVillager(villagerName: selectedName));
                              print("list after added : $list");
                            }

                            // list?.add(
                            //     FavoriteVillager(villagerName: selectedName));
                            // print('즐겨찾기 클릭 후 favoriteList : $list');
                            // print(
                            //     '추가 후 favoriteList : ${list == null ? null : list!.length}');
                            // favoriteList?.add(
                            //     FavoriteVillager(villagerName: selectedName));
                            // list?.add(
                            //     FavoriteVillager(villagerName: selectedName));
                            print('추가 후 favoriteList : $list');
                            print(
                                '추가 후 favoriteList : ${list == null ? null : list!.length}');
                          });
                        },
                      ), //즐겨찾기 버튼 영역
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    // '아잠만',
                    //translator.translate(detailData["name"], from: 'en', to: 'ko').toString(),
                    detailData["name"] == null ? '주민의 이름은' : detailData["name"],
                    style: TextStyle(
                        fontFamily: 'Monggle',
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: white),
                  ), // 주민 이름
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.white,
                    child: Image.network(
                      detailData["image_url"] == null
                          ? 'https://soopool.art/img/infoac/NPC/Tom_Nook/Tom_Nook.png'
                          : detailData["image_url"],
                      height: 180,
                    ),
                  ), // 주민 이미지
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      // height: (screenHeight - 556),
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (screenWidth - 80) * 0.3,
                            alignment: Alignment.center,
                            child: Text('성별', style: profileTextStyle()),
                          ),
                          Text(':', style: profileTextStyle()),
                          Container(
                            width: (screenWidth - 80) * 0.68,
                            alignment: Alignment.center,
                            child: Image.asset(
                              // detailData["gender"] == "Male" ? 'assets/images/${detailData["gender"]}.png' : 'assets/images/Female.png',
                              'assets/images/${detailData["gender"] == null ? 'Female' : detailData["gender"]}.png',
                              width: 30,
                              height: 30,
                            ),
                          ) // 성별
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (screenWidth - 80) * 0.3,
                            alignment: Alignment.center,
                            child: Text('종족', style: profileTextStyle()),
                          ),
                          Text(':', style: profileTextStyle()),
                          Container(
                            width: (screenWidth - 80) * 0.68,
                            alignment: Alignment.center,
                            child: Text(
                                detailData["species"] == null
                                    ? '주민의 종족은'
                                    : detailData["species"],
                                style: profileTextStyle()),
                          ), // 종족
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (screenWidth - 80) * 0.3,
                            alignment: Alignment.center,
                            child: Text('성격', style: profileTextStyle()),
                          ),
                          Text(':', style: profileTextStyle()),
                          Container(
                            width: (screenWidth - 80) * 0.68,
                            alignment: Alignment.center,
                            child: Text(
                                detailData["personality"] == null
                                    ? '주민의 성격은'
                                    : detailData["personality"],
                                style: profileTextStyle()),
                          ), // 성별
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (screenWidth - 80) * 0.3,
                            alignment: Alignment.center,
                            child: Text('생일', style: profileTextStyle()),
                          ),
                          Text(':', style: profileTextStyle()),
                          Container(
                            width: (screenWidth - 80) * 0.68,
                            alignment: Alignment.center,
                            child: Text(
                                "${detailData["birthday_month"] == null ? '주민의 생일 월은' : detailData["birthday_month"]} ${detailData["birthday_day"] == null ? '주민의 생일 날은' : detailData["birthday_day"]}일",
                                style: profileTextStyle()),
                          ), // 생일
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (screenWidth - 80) * 0.3,
                            alignment: Alignment.center,
                            child: Text('별자리', style: profileTextStyle()),
                          ),
                          Text(':', style: profileTextStyle()),
                          Container(
                            width: (screenWidth - 80) * 0.68,
                            alignment: Alignment.center,
                            child: Text("${detailData["sign"]}자리",
                                style: profileTextStyle()),
                          ), // 별자리
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (screenWidth - 80) * 0.3,
                            alignment: Alignment.center,
                            child: Text('말버릇', style: profileTextStyle()),
                          ),
                          Text(':', style: profileTextStyle()),
                          Container(
                            width: (screenWidth - 80) * 0.68,
                            alignment: Alignment.center,
                            child: Text(
                                detailData["phrase"] == null
                                    ? '주민의 말버릇은'
                                    : detailData["phrase"],
                                style: profileTextStyle()),
                          ), // 말버릇
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: (screenWidth - 80) * 0.3,
                            alignment: Alignment.center,
                            child: Text('좋아하는 말', style: profileTextStyle()),
                          ),
                          Text(':', style: profileTextStyle()),
                          Container(
                            width: (screenWidth - 80) * 0.68,
                            alignment: Alignment.center,
                            child: Text(
                                detailData["quote"] == null
                                    ? '주민의 말버릇은'
                                    : detailData["quote"],
                                style: profileTextStyle()),
                          ), // 좋아하는 말
                        ],
                      ),
                    ],
                  )
                      // : Text(
                      //     explanation,
                      //     style: profileTextStyle(),
                      //   ),
                      ),
                  // 주민 프로필 정보
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     TextButton(
            //         onPressed: () {
            //           setState(() {
            //             showDetail = false;
            //           });
            //         },
            //         child: Container(
            //           height: 40,
            //           padding: EdgeInsets.symmetric(horizontal: 40.0),
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //               color: yellow,
            //               borderRadius: BorderRadius.all(Radius.circular(40.0)),
            //               boxShadow: [
            //                 BoxShadow(offset: const Offset(4, 4), color: brown)
            //               ]),
            //           child: Text(
            //             '이전',
            //             style: TextStyle(
            //                 color: white, fontFamily: 'Monggle', fontSize: 16),
            //           ),
            //         )),
            //     showDetail == false
            //         ? TextButton(
            //             onPressed: () {
            //               setState(() {
            //                 showDetail = !showDetail;
            //               });
            //             },
            //             child: Container(
            //               height: 40,
            //               padding: EdgeInsets.symmetric(horizontal: 40.0),
            //               alignment: Alignment.center,
            //               decoration: BoxDecoration(
            //                   color: mainGreen,
            //                   borderRadius:
            //                       BorderRadius.all(Radius.circular(40.0)),
            //                   boxShadow: [
            //                     BoxShadow(
            //                         offset: const Offset(4, 4),
            //                         color: darkGreen)
            //                   ]),
            //               child: Text(
            //                 '다음',
            //                 style: TextStyle(
            //                     color: white,
            //                     fontFamily: 'Monggle',
            //                     fontSize: 16),
            //               ),
            //             ))
            //         : Text(''),
            //   ],
            // ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // 기기 화면 width
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: SubAppBar(),
      bottomNavigationBar: bottomNavigator(context, currentPageIndex),
      body: SafeArea(
        child: SingleChildScrollView(
          child: hideLoading == true
              ? profileInfo(screenWidth, screenHeight)
              : loading(context), // detail profile section
        ),
      ),
    );
  }

  // api
  Future<void> getInfo(String selectedName) async {
    var url = 'https://api.nookipedia.com/villagers';
    var response = await http.get(Uri.parse(url),
        headers: {"X-API-KEY": "1e12770e-930f-4f94-8bf2-7dd37587e30b"});
    setState(() {
      // var dataConvertedToJSON = json.decode(response.body);
      // String result = dataConvertedToJSON[20];
      // data!.addAll(result);
    });
    detailInfo = json.decode(response.body);

    final translator = GoogleTranslator();
    for (var i = 0; i < detailInfo.length; i++) {
      if (detailInfo[i]["name"] == selectedName) {
        print("Apple의 순서 : $i");
        // detailInfo = detailInfo[i];
        // for (var villager in data) {
        var translatedName = await translator.translate(detailInfo[i]['name'],
            from: 'en', to: 'ko');
        var translatedSpecies = await translator
            .translate(detailInfo[i]['species'], from: 'en', to: 'ko');
        var translatedPersonality = await translator
            .translate(detailInfo[i]['personality'], from: 'en', to: 'ko');
        var translatedBirth = await translator
            .translate(detailInfo[i]['birthday_month'], from: 'en', to: 'ko');
        var translatedSign = await translator.translate(detailInfo[i]['sign'],
            from: 'en', to: 'ko');
        var translatedPhrase = await translator
            .translate(detailInfo[i]['phrase'], from: 'en', to: 'ko');
        var translatedQuote = await translator.translate(detailInfo[i]['quote'],
            from: 'en', to: 'ko');
        //villager['name'] = translatedName.text;
        //   // print(translatedName);
        // }
        detailData = detailInfo[i];
        print("detailInfo before translated : $detailData");
        detailData["name"] = translatedName.text;
        detailData["species"] = translatedSpecies.text;
        detailData["personality"] = translatedPersonality.text;
        detailData["birthday_month"] = translatedBirth.text;
        detailData["sign"] = translatedSign.text;
        detailData["phrase"] = translatedPhrase.text;
        detailData["quote"] = translatedQuote.text;
        print("detailInfo after translated : $detailData");
        print("name : ${detailData["name"]}");
      }
    }

    // var dataConvertedToJSON = json.decode(response.body);
    // print(dataConvertedToJSON);
    // print(dataConvertedToJSON[20]);
    // print("detailInfo length : ${detailInfo.length}");
    // print(dataConvertedToJSON[20]["name"].toString());
    // print(dataConvertedToJSON[20]["url"].toString());
    //String result = dataConvertedToJSON[20].name;
    //return response.body;
    // return result;
  }

  // String explanation =
  //     ' 아잠만은 동물의 숲 시리즈의 먹보 오리 입니다.아잠만은 자연을 좋아하는 취미를 가지고 있으며, 꽃, 벌레, 물고기 또는 화석에 대해 공부하고 있는 아이템에 대한 책을 읽고 있을 수 있습니다. 그의 영어 이름은 오리의 물갈퀴 발에서 유래한 "web"이라는 단어를 이용한 말장난입니다. 그의 영어 말버릇, "quaa,"는 오리의 울음소리 "quack"을 따라한 말장난입니다. ';
}

Widget loading(context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return Container(
    width: double.infinity,
    height: (screenHeight - 120),
    decoration: const BoxDecoration(
      color: white,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 100.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '로딩 중입니다.\n잠시만 기다려주세요.',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Monggle',
              fontWeight: FontWeight.w700,
              color: mainGreen,
            ),
            textAlign: TextAlign.center,
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
    ),
  );
}

위 코드로 global variable로 선언한 globals.globalList에 add메소드를 사용해도 계속globals.globalList가 null로 나오는데, 업데이트가 안되는 이유가 뭘까
ChatGPT

문제의 원인은 globals.globalList를 수정하거나 업데이트할 때, 해당 클래스의 인스턴스를 변경하지 않기 때문입니다. globals.globalList가 외부에서 선언된 변수이므로 해당 변수를 직접 수정하는 것은 변수의 참조를 변경하는 것이 아니라 변수가 참조하는 리스트의 요소를 변경하는 것입니다.

따라서 globals.globalList를 수정할 때마다 해당 클래스의 인스턴스를 변경해야 합니다. 이를 위해 다음과 같이 수정할 수 있습니다.

dart

globals.globalList!.add(FavoriteVillager(villagerName: selectedName));
globals.globalList = globals.globalList; // 이 줄을 추가하면 globals.globalList가 업데이트됩니다.

위의 코드에서 globals.globalList = globals.globalList; 부분은 실제로는 아무런 역할을 하지 않지만, 이를 통해 Dart에게 변수를 변경했다는 것을 알려줍니다. 이를 통해 Flutter는 해당 변수가 변경되었음을 감지하고 화면을 다시 그릴 수 있습니다.

따라서 다음과 같이 변경하여 업데이트를 시도할 수 있습니다.

dart

globals.globalList!.add(FavoriteVillager(villagerName: selectedName));
globals.globalList = globals.globalList!;

또는

dart

setState(() {
  globals.globalList!.add(FavoriteVillager(villagerName: selectedName));
});

이렇게 하면 globals.globalList가 업데이트되고, 해당 변경 사항이 반영된 새로운 리스트가 전역으로 사용될 수 있습니다.
setState(() {
                            ActivateFavorite = !ActivateFavorite;
                            if (ActivateFavorite == false) {
                              print("inactivate favorite");
                              globals.globalList?.add(
                                  FavoriteVillager(villagerName: selectedName));
                              globals.globalList = globals.globalList;
                              print(
                                  "globals.globalList after removed : ${globals.globalList}");
                              //list!.remove(FavoriteVillager(villagerName: selectedName));
                              list?.removeLast();
                              print("list after removed : $list");
                            } else {
                              print("activate favorite");
                              globals.globalList?.add(
                                  FavoriteVillager(villagerName: selectedName));
                              globals.globalList = globals.globalList;
                              print(
                                  "globals.globalList after added : ${globals.globalList}");
                              list?.add(
                                  FavoriteVillager(villagerName: selectedName));
                              print("list after added : $list");
                            }

                            // list?.add(
                            //     FavoriteVillager(villagerName: selectedName));
                            // print('즐겨찾기 클릭 후 favoriteList : $list');
                            // print(
                            //     '추가 후 favoriteList : ${list == null ? null : list!.length}');
                            // favoriteList?.add(
                            //     FavoriteVillager(villagerName: selectedName));
                            // list?.add(
                            //     FavoriteVillager(villagerName: selectedName));
                            print('추가 후 favoriteList : $list');
                            print(
                                '추가 후 favoriteList : ${list == null ? null : list!.length}');
                          });
위 코드에서 setState부분을 저렇게 수정했는데도 globalList가  null로 출력되는 걸
ChatGPT

setState 내에서 globals.globalList를 업데이트하는 것은 상황에 따라 문제를 일으킬 수 있습니다. 외부에서 정의된 전역 변수에 직접적으로 값을 할당하는 것이 아니라, 해당 변수를 수정하는 것은 좋은 습관이 아닙니다. 대신에 setState 내에서는 해당 변수를 직접 수정하는 것이 아니라, 해당 변수에 새로운 값을 할당한 새로운 객체를 생성하여 setState 내에서 사용해야 합니다.

따라서 코드를 다음과 같이 수정하는 것이 좋습니다.

dart

setState(() {
  ActivateFavorite = !ActivateFavorite;
  FavoriteVillager newVillager = FavoriteVillager(villagerName: selectedName);
  if (ActivateFavorite == false) {
    print("inactivate favorite");
    globals.globalList?.add(newVillager);
    list?.removeLast();
  } else {
    print("activate favorite");
    globals.globalList?.add(newVillager);
    list?.add(newVillager);
  }
});

이렇게 수정하면 globals.globalList가 외부에서 정의된 전역 변수이지만, 새로운 객체를 추가하고 나서 이를 다시 할당하여 업데이트됩니다. 이렇게 하면 setState가 호출될 때마다 새로운 객체가 생성되어 해당 변수가 변경되었음을 Flutter 프레임워크에 알릴 수 있습니다.
위 코드로 변경했는데도 globalList가 null로 나와
ChatGPT

코드를 다시 살펴보니, globals.globalList가 외부에서 정의된 전역 변수이므로 이 변수 자체를 업데이트하는 것은 적절하지 않습니다. 대신에 해당 전역 변수를 수정할 때 새로운 리스트를 할당해야 합니다. 아래와 같이 코드를 수정해 보세요.

dart

setState(() {
  ActivateFavorite = !ActivateFavorite;
  FavoriteVillager newVillager = FavoriteVillager(villagerName: selectedName);
  if (ActivateFavorite == false) {
    print("inactivate favorite");
    globals.globalList = [...globals.globalList ?? [], newVillager];
    list?.removeLast();
  } else {
    print("activate favorite");
    globals.globalList = [...globals.globalList ?? [], newVillager];
    list?.add(newVillager);
  }
});

위 코드는 globals.globalList가 null일 경우를 대비하여 널 체크를 수행한 후, 새로운 객체를 추가하여 전역 변수를 업데이트합니다. 이렇게 하면 setState 호출 후 globals.globalList가 null이 되는 문제를 해결할 수 있습니다.
위 코드에서 setState내에서 ActivateFavorite가 false일때는 globals.globalList에서 newVillager를 제거하고 ActivateFavorite가 true일때는 globals.globalList에서 newVillager를 추가하는 내용으로 변경해줘
ChatGPT

아래 코드에서는 ActivateFavorite가 true일 때는 globals.globalList에 newVillager를 추가하고, false일 때는 newVillager를 제거합니다.

dart

setState(() {
  FavoriteVillager newVillager = FavoriteVillager(villagerName: selectedName);
  if (ActivateFavorite) {
    print("activate favorite");
    globals.globalList = [...globals.globalList ?? [], newVillager];
    list?.add(newVillager);
  } else {
    print("inactivate favorite");
    globals.globalList = [...globals.globalList ?? []];
    globals.globalList.remove(newVillager);
    list?.remove(newVillager);
  }
});

이 코드는 ActivateFavorite가 true일 때는 newVillager를 추가하고, false일 때는 제거합니다. 코드를 통해 전역 변수를 업데이트할 수 있습니다.
위 코드에서 추가는 되는데 삭제가 안돼
ChatGPT

삭제가 안되는 이유는 FavoriteVillager 객체의 동등성이 유지되지 않기 때문입니다.

다음과 같이 FavoriteVillager 클래스에 == 연산자를 오버라이드하여 두 객체가 같은지 확인하고, hashCode를 오버라이드하여 동등한 객체에 대해 동일한 해시 코드를 반환하도록 수정할 수 있습니다.

dart

class FavoriteVillager {
  String villagerName;

  FavoriteVillager({required this.villagerName});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteVillager &&
          runtimeType == other.runtimeType &&
          villagerName == other.villagerName;

  @override
  int get hashCode => villagerName.hashCode;
}

그러면 globals.globalList.remove(newVillager);에서 remove 메서드가 올바르게 작동할 것입니다.
