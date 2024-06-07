import 'package:chap04_flutter_api/const/colors.dart';
import 'package:chap04_flutter_api/screen/search/search_Name.dart';
import 'package:chap04_flutter_api/screen/search/select_birthday_month.dart';
import 'package:chap04_flutter_api/screen/search/select_species.dart';
import 'package:flutter/material.dart';

import '../../widget/navigationbar.dart';

void main() {
  runApp(SearchPage());
}

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchMainPage(),
    );
  }
}

class SearchMainPage extends StatefulWidget {
  @override
  _SearchMainPageState createState() => _SearchMainPageState();
}

class _SearchMainPageState extends State<SearchMainPage> {
  String? selectedSpecies;
  String? selectedBirthdayMonth;
  bool showSpeciesOptions = true;
  String? searchText = '';
  int currentPage = 0;

  void submitSearch() {
    if (searchText!.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchNamePage(searchText)),
      );
    }
  }

  void toggleSpeciesOptions() {
    setState(() {
      showSpeciesOptions = true;
    });
  }

  void toggleBirthdayOptions() {
    setState(() {
      showSpeciesOptions = false;
    });
  }

  void selectSpecies(String species) {
    setState(() {
      selectedSpecies = species;
      showSpeciesOptions = true;
    });
  }

  void selectBirthdayMonth(String month) {
    setState(() {
      selectedBirthdayMonth = month;
      showSpeciesOptions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드 때문에 발생하는 오버플로우 방지
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
      bottomNavigationBar: bottomNavigator(context, currentPage),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: 320,
              height: 40,
              decoration: BoxDecoration(
                  color: mainGreen,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF00753F),
                      offset: Offset(2, 3),
                    )
                  ]),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    searchText = text;
                  });
                },
                onSubmitted: (value) {
                  submitSearch();
                },
                decoration: InputDecoration(
                  hintText: '',
                  suffixIcon: Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: showSpeciesOptions
                        ? [
                            BoxShadow(
                              color: Color(0xFFA95B00),
                              offset: Offset(2, 3),
                            ),
                          ]
                        : [],
                  ),
                  child: ElevatedButton(
                    onPressed: toggleSpeciesOptions,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          showSpeciesOptions ? yellow : Colors.white, // 원하는 배경색
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      '종족',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Monggle',
                          color: showSpeciesOptions
                              ? Colors.white
                              : Colors.yellow),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: showSpeciesOptions
                        ? []
                        : [
                            BoxShadow(
                              color: Color(0xFF0081DC),
                              offset: Offset(2, 3),
                            ),
                          ],
                  ),
                  child: ElevatedButton(
                    onPressed: toggleBirthdayOptions,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          showSpeciesOptions ? Colors.white : blue, // 원하는 배경색
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      '생일',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Monggle',
                          color: showSpeciesOptions ? blue : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: 320,
              height: showSpeciesOptions ? 378 : 260,
              decoration: BoxDecoration(
                color: showSpeciesOptions
                    ? yellow.withOpacity(0.5)
                    : blue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: showSpeciesOptions
                  ? Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // 개 버튼
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('개');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Dog',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '개'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '개',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '개'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('고양이');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Cat',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '고양이'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '고양이',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '고양이'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('꼬마곰');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Bear cub',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '꼬마곰'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '꼬마곰',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '꼬마곰'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('다람쥐');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Squirrel',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '다람쥐'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '다람쥐',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '다람쥐'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('사슴');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Deer',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '사슴'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '사슴',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '사슴'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('새');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Bird',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '새'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '새',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '새'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('악어');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Alligator',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '악어'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '악어',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '악어'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('양');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Sheep',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '양'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '양',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '양'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('쥐');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Mouse',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '쥐'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '쥐',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '쥐'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('개구리');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Frog',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '개구리'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '개구리',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '개구리'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('곰');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Bear',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '곰'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '곰',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '곰'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('늑대');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Wolf',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '늑대'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '늑대',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '늑대'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('닭');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Chicken',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '닭'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '닭',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '닭'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('돼지');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Pig',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '돼지'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '돼지',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '돼지'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('사자');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Lion',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '사자'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '사자',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '사자'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('원숭이');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Monkey',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '원숭이'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '원숭이',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '원숭이'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('토끼');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Rabbit',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '토끼'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '토끼',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '토끼'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectSpecies('펭귄');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedSpeciesApp(
                                          selectedSpecies: 'Penguin',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedSpecies == '펭귄'
                                        ? yellow
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '펭귄',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedSpecies == '펭귄'
                                          ? Colors.white
                                          : yellow,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('1월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'January',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '1월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '1월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '1월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('3월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'March',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '3월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '3월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '3월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('5월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'May',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '5월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '5월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '5월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('7월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'July',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '7월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '7월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '7월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('9월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'September',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '9월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '9월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '9월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('11월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'November',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '11월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '11월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '11월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('2월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'February',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '2월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '2월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '2월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('4월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'April',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '4월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '4월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '4월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('6월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'June',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '6월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '6월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '6월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('8월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'August',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '8월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '8월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '8월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('10월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'October',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '10월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '10월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '10월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    selectBirthdayMonth('12월');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedBirthdayMonthPage(
                                          selectedBirthdayMonth: 'December',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBirthdayMonth == '12월'
                                            ? blue
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '12월',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Monggle',
                                      color: selectedBirthdayMonth == '12월'
                                          ? Colors.white
                                          : blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
