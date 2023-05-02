import 'package:flutter/material.dart';
import 'package:flutter_application_route/page1.dart';
import 'package:flutter_application_route/page2.dart';
import 'package:flutter_application_route/page3.dart';
import 'package:flutter_application_route/page4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(label: 'home', icon: Icon(Icons.home)),
    const BottomNavigationBarItem(label: 'chat', icon: Icon(Icons.chat)),
    const BottomNavigationBarItem(label: 'shop', icon: Icon(Icons.shop)),
    const BottomNavigationBarItem(label: 'My', icon: Icon(Icons.people)),
  ];
  int now = 0; // 현재 인덱스 번호를 저장한다~
  var pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4()
  ]; // 페이지를 저장하는 배열~
  var nowPage;
  void changePage(int page) {
    setState(() {
      now = page;
      nowPage = pages[page];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Scaffold : 도움 틀
        body: nowPage,
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              changePage(value);
            },
            currentIndex: now,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.yellow,
            items: bottomItems),
      ),
    );
  }
}
