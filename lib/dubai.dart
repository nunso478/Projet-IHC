import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'swipe_animation.dart';
import 'side_menu.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Dubai(),
    );
  }
}

class Dubai extends StatefulWidget {
  @override
  _DubaiState createState() => _DubaiState();
}

class _DubaiState extends State<Dubai> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      " ",
      " ",
      "     ",
      " ",
      "  ",
      " ",
    ];

    final List<Widget> images = [
      Image.asset(
        'assets/dubai.jfif',
        width: 100,
        height: 100,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {},
                  align: ALIGN.CENTER,
                  onSelectedItem: (index) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
