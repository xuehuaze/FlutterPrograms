import 'package:flutter/material.dart';

import 'widgets/base/base_page.dart';
import 'widgets/pages/about/about.dart';
import 'widgets/pages/home/home.dart';
import 'widgets/pages/program/program.dart';

class Main extends StatefulWidget {
  Main({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _activeIndex = 0;
  var _home = Home();
  var _program = Program();
  var _about = About();
  List<BasePage> get _pages {
    return [_home, _program, _about];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeIndex,
        onTap: (index) {
          setState(() {
            _activeIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(_home.title),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text(_program.title),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error),
            title: Text(_about.title),
          ),
        ],
      ),
      body: IndexedStack(
        children: _pages,
        index: _activeIndex,
      ),
    );
  }
}
