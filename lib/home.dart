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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      Image.asset(
        'assets/vespas.png',
        width: 100,
        height: 100,
      ),
      Image.asset(
        'assets/Mini.jpg',
        width: 100,
        height: 100,
      ),
      Image.asset(
        'assets/copa.jfif',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/living.png',
        width: 100,
        height: 100,
      ),
      Image.asset(
        'assets/jpoint.jpg',
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
