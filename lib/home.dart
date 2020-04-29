import 'package:complainbox/auth.dart';
import 'package:flutter/material.dart';
import 'package:complainbox/ComplainePage.dart';
import 'package:complainbox/FEEDS.DART';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;

  final tabs = [ComplainPage(), FeedsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.camera),
              title: Text('COMPLAIN'),
              backgroundColor: Colors.teal
          ),
          BottomNavigationBarItem(icon: Icon(Icons.find_in_page),
              backgroundColor: Colors.amber,
              title: Text('FEEDS'))
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
