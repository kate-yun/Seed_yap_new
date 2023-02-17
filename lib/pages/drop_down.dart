import 'package:flutter/material.dart';

import 'package:seed_yap/config/colors.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
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

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Row(children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          margin: EdgeInsets.only(left: 20, top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            //border: Border.all(width: 1, color: Colors.grey),
          ),
          child: SizedBox(
            child: DropdownButton(
              items: dropYear.map<DropdownMenuItem<String>>((String mascot) {
                return DropdownMenuItem<String>(
                    child: Text(mascot), value: mascot);
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
          margin: EdgeInsets.only(top: 20, right: 185),
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
                    child: Text(mascot), value: mascot);
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
      ]),
    ])));
  }
}










/*
const List<String> list = <String>[
  '1월',
  '2월',
  '3월',
  '4월',
  '5월',
  '6월',
  '7월',
  '8월',
  '9월',
  '10월',
  '11월',
  '12월'
];

class DropDwonButton extends StatefulWidget {
  const DropDwonButton({super.key});

  @override
  State<DropDwonButton> createState() => _DropDwonButtonState();
}

class _DropDwonButtonState extends State<DropDwonButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
*/