import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed_yap/config/colors.dart';
import 'package:seed_yap/pages/block_page.dart';
import 'package:seed_yap/pages/harvest_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'seedyap',
      theme: ThemeData(
        scaffoldBackgroundColor: Background.bgc,
        fontFamily: 'Dong',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  bool _isBottomClicked = false;

  final _pages = [
    BlockPage(),
    HarvestPage(),
  ];

  late AssetImage _assetImage;

  bool _isGoalSet = false;
  final _goalTextController = TextEditingController(text: '');

  String _goal = '';
  String? error;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _goalTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _drawPage(),
      floatingActionButton: (FloatingActionButton(
        onPressed: () {
          String goal = _goalTextController.text;
          if (goal.isEmpty) {
            setState(() {
              error = '3일동안 어떤 목표를 이루고 싶으신가요?';
            });
          } else {
            setState(() {
              error = null;

              _isGoalSet = true;
            });
          }

          //_isGoalSet = true;
          //});
          _assetImage.evict();
          // _goal = _goalTextController.value.text;
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (_) => CreatePage()),
          // );
        },
        // ignore: sort_child_properties_last
        child: Image.asset('lib/icons/IMG_0633.PNG'),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Background.box,
          selectedItemColor: Colors.green[500],
          unselectedItemColor: FontColor.bottomfont,
          selectedFontSize: 18,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _isBottomClicked = true;
              _selectedIndex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar),
              label: '목표',
            ),
            const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.calendar_today), label: '수확'),
          ],
        ),
      ),
    );
  }

  Widget _drawPage() {
    if (!_isBottomClicked) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isGoalSet
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                          );
                        },
                        icon: Icon(Icons.refresh),
                        label: Text("재설정"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[400],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
          _imageWidget(),
          _textEditor(),
        ],
      );
    } else {
      return _pages[_selectedIndex];
    }
  }

  Image _imageWidget() {
    if (!_isGoalSet) {
      _assetImage = AssetImage('assets/gif/00.gif');
      return Image(image: _assetImage, width: 300, height: 450);
    } else {
      return Image.asset(
        'assets/gif/01.gif',
        width: 300,
        height: 400,
      );
    }
  }

  Widget _textEditor() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: _goalTextController,
        readOnly: _isGoalSet,
        decoration: InputDecoration(
          hintText: '목표를 입력해 주세요!',
          errorText: error,
        ),
      ),
    );
  }
}
