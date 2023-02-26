// ignore_for_file: unused_import

import 'dart:math';
import 'package:seed_yap/pages/drop_down.dart';
import 'package:flutter/material.dart';

class HarvestPage extends StatefulWidget {
  const HarvestPage({super.key});

  @override
  State<HarvestPage> createState() => _HarvestPageState();
}

class _HarvestPageState extends State<HarvestPage> {
  final List<String> _goals = [
    'erer',
    'erere',
    'ererer',
    'erer',
    'erere',
    'erere',
    'erer',
    'erere',
    'ererer',
    'erer',
    'erere',
    'erere',
    'erer',
    'erere',
    'ererer',
    'erer',
    'erere',
    'erere'
  ];

  String? _dropdownValue;
  List<String> dropDownOptions = [
    "1월",
    "2월",
    "3월",
    "4월",
    "5월",
    "6월",
    "7월",
    "8월",
    "9월",
    "10월",
    "11월",
    "12월",
  ];

  String? _dropdownYear;
  List<String> dropYear = [
    "2023년",
    "2024년",
    "2025년",
    "2026년",
    "2027년",
    "2028년",
    "2029년",
    "2030년",
    "2031년",
    "2032년"
  ];

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  void dropdownCallbackyear(String? selectedYear) {
    if (selectedYear is String) {
      setState(() {
        _dropdownYear = selectedYear;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              margin: EdgeInsets.only(left: 25, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                //border: Border.all(width: 1, color: Colors.grey),
              ),
              child: SizedBox(
                child: DropdownButton(
                  items:
                      dropYear.map<DropdownMenuItem<String>>((String mascot) {
                    return DropdownMenuItem<String>(
                        value: mascot, child: Text(mascot));
                  }).toList(),

                  value: _dropdownYear,
                  hint: const Text('년'),
                  onChanged: dropdownCallbackyear,
                  iconSize: 35.0,
                  iconEnabledColor: Colors.black,
                  underline: Container(color: Colors.white),

                  //icon: const Icon(Icons.vertical_align_bottom),
                  //isExpanded: true,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Dong',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(left: 15),
              margin: EdgeInsets.only(top: 20, right: 180),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                //border: Border.all(width: 1, color: Colors.grey),
              ),
              child: SizedBox(
                child: DropdownButton(
                  items: dropDownOptions
                      .map<DropdownMenuItem<String>>((String mascot) {
                    return DropdownMenuItem<String>(
                        value: mascot, child: Text(mascot));
                  }).toList(),

                  value: _dropdownValue,
                  hint: const Text('월'),
                  onChanged: dropdownCallback,
                  iconSize: 35.0,
                  iconEnabledColor: Colors.black,
                  underline: Container(color: Colors.white),

                  //icon: const Icon(Icons.vertical_align_bottom),
                  //isExpanded: true,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Dong',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ]), // Dropdown 추가
          const Spacer(flex: 1),
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              //decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(50)), //대충잡은거 . 나중에 수정 필요
              child: Card(
                  elevation: 10,
                  child: _goals.isEmpty ? _noGoals() : _drawGrid()),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    ));
  }

  Widget _noGoals() {
    return Center(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 180)),
          Text(
            '수확물이 없네요ㅠㅠ',
            style: TextStyle(fontSize: 20),
          ),
          Image.asset('assets/image/create.png', width: 200, height: 200),
        ],
      ),
    );
  }

  Widget _drawGrid() {
    return GridView.builder(
      itemCount: _goals.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              flex: 2,
              child: _getRandomImage(), // 이 이미지가 랜덤으로 assets/sticker 폴더로부터 생성
            ),
          ],
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: .9,
      ),
    );
  }

  Image _getRandomImage() {
    var rand = Random(DateTime.now().millisecondsSinceEpoch);
    return Image.asset(
      'assets/stamp/${rand.nextInt(14)}.png',
      fit: BoxFit.contain,
    );
  }
}
