//import 'package:block_page/calendar.dart';
import 'package:flutter/material.dart';
//import 'package:simple_month_year_picker/simple_month_year_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Dong',
        scaffoldBackgroundColor: Color.fromARGB(255, 181, 228, 234),
      ),
      home: BlockPage(),
    );
  }
}

class Block {
  String job;
  bool isDone;

  Block(this.job, {this.isDone = false});
}

class BlockPage extends StatefulWidget {
  const BlockPage({super.key});

  @override
  State<BlockPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BlockPage> {
  final List<Block> blockList = [
    Block('일찍 일어나기'),
    Block('일찍 일어나기'),
    Block('일찍 일어나기'),
    Block('일찍 일어나기'),
    Block('일찍 일어나기'),
    Block('일찍 일어나기'),
    Block('일찍 일어나기'),
    Block('일찍 일어나기'),
    Block('일찍 일어나기'),
    Block('일찍 일어나기'),
    Block('일찍 일어나기')
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
      backgroundColor: Color.fromARGB(255, 181, 228, 234),
      /*appBar: AppBar(
        elevation: 0,

        //leading: MyCale(),
        //달력
      ),*/
      body:
          //목표가 없을 때
          SafeArea(
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
            ]),
            Spacer(),
            Image.asset(
              'assets/image/15.PNG',
              height: 300,
              width: 250,
            ),
            Column(
              children: _weweweweweee(),
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Image.asset('lib/icons/IMG_0633.PNG')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton.icon(
                onPressed: () {},
                icon: Icon(CupertinoIcons.chart_bar, color: Colors.green[400]),
                label: Text(
                  '목표',
                  style: TextStyle(color: Colors.green[400]),
                ),
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.calendar_today,
                      color: Colors.green[400]),
                  label: Text(
                    '수확',
                    style: TextStyle(color: Colors.green[400]),
                  )),
            ]),
      ),*/
    );
  }

  List<Widget> _weweweweweee() {
    List<Widget> weweColumn = [];
    for (int i = 0; i < blockList.length; i++) {
      weweColumn.add(
        Card(
          elevation: 0,
          margin: i % 2 == 0
              ? EdgeInsets.only(left: 10)
              : EdgeInsets.only(right: 10),
          color: i % 2 == 0 ? Colors.green[100] : Colors.yellow[100],
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: SizedBox(
            width: 250,
            height: 50,
            child: ListTile(
              leading: Icon(Icons.local_florist),
              title: Text(
                blockList[i].job,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return weweColumn;
  }
}
