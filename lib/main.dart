import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_navigation_drawer/home.dart';
import 'side_menu.dart';
import 'dubai.dart';
import 'copacabana.dart';
import 'livingroom.dart';
import 'mini.dart';
import 'vespas.dart';
import 'gpoint.dart';

import 'swipe_animation.dart';
import 'model/model.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'swipe_animation.dart';
import 'side_menu.dart';

import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFFFFFF, color),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  Animation<double> animation;
  AnimationController controller;
  bool isNavigationDrawerOpened = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<SwipeAnimationState> swipeAnimationKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SideMenu(
              onMenuItemSelection: (pageIndex) {
                swipeAnimationKey.currentState.hideNavigationDrawer();
                setState(() {
                  currentPage = pageIndex;
                });
              },
            ),
            SwipeAnimation(
              key: swipeAnimationKey,
              navigationDrawerOpened: (isOpened) {
                isNavigationDrawerOpened = isOpened;
                if (isNavigationDrawerOpened) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
              child: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  brightness: Brightness.dark,
                  leading: IconButton(
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.arrow_menu,
                      progress: animation,
                    ),
                    onPressed: () {
                      if (isNavigationDrawerOpened) {
                        controller.reverse();
                        swipeAnimationKey.currentState.hideNavigationDrawer();
                      } else {
                        controller.forward();
                        swipeAnimationKey.currentState.showNavigationDrawer();
                      }
                    },
                  ),
                  title: Text(menuItems[currentPage].menuName),
                ),
                body: Container(
                    color: Colors.black,
                    height: double.infinity,
                    width: double.infinity,
                    child: HomePage()),
              ),
            )
          ],
        ),
      ),
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
      "",
      "  ",
      "      ",
      "  ",
      "   ",
      "  ",
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
            Container(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  // textStyle: TextStyle(color : Colors.red),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {
                    // print(page);
                  },
                  onSelectedItem: (index) {
                    print("index ------------ " + index.toString());
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyDubai()));
                    } else if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyVespas()));
                    } else if (index == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyMini()));
                    } else if (index == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MyCopacabana()));
                    } else if (index == 4) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyLiving()));
                    } else if (index == 5) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyGpoint()));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
