import 'package:flutter/material.dart';
import 'package:flutter_application_portfolio/dice_main.dart';
import 'package:flutter_application_portfolio/my_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  // 하단 아이템들 배열
  List<BottomNavigationBarItem> items = [];
  dynamic bodyPage;
  List<dynamic> pages = [
    const MyTimer(),
    const MyTimer(),
    const MyDice(),
    const MyTimer(),
  ];

  void movePage(int page) {
    print(page);
    setState(() {
      _index = page;
      bodyPage = pages[page];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '홈',
      backgroundColor: Colors.pink,
    ));
    items.add(const BottomNavigationBarItem(
      icon: Icon(Icons.timer_sharp),
      activeIcon: Icon(Icons.timer_sharp, color: Colors.red),
      label: '타이머',
      backgroundColor: Colors.yellowAccent,
    ));
    items.add(const BottomNavigationBarItem(
      icon: Icon(Icons.check_rounded),
      label: '뽑기',
      backgroundColor: Colors.blueGrey,
    ));
    items.add(const BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.comment),
        label: '소개',
        backgroundColor: Colors.amber));

    // 첫페이지 지정
    bodyPage = const Center(
      child: FaIcon(
        FontAwesomeIcons.comment,
        size: 40,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: bodyPage,
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              movePage(value);
            },
            unselectedLabelStyle: const TextStyle(color: Colors.amber),
            type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            //type: BottomNavigationBarType.fixed,
            //backgroundColor: Colors.greenAccent,
            items: items),
      ),
    );
  }
}
