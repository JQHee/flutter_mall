import 'package:flutter/material.dart';

/**
 * 首页
 */

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
      body: Center(
        child: Text('商城首页'),
      ),
    );
  }

}