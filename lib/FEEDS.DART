import 'package:complainbox/complains.dart';
import 'package:flutter/material.dart';

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('complains')
    ),
    body: Complains(),
    );
  }
}