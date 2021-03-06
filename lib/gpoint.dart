import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_navigation_drawer/side_menu.dart';
import 'package:sliding_navigation_drawer/swipe_animation.dart';

import 'model/model.dart';

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
      home: MyGpoint(),
    );
  }
}

class MyGpoint extends StatefulWidget {
  @override
  _MyGpointState createState() => _MyGpointState();
}

class _MyGpointState extends State<MyGpoint>
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
              navigationDrawerOpened: (bool isOpened) {
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
                body: Column(children: <Widget>[
                  Row(
                    //ROW 1
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 105),
                        child: const Text('Gpoint',
                            style: TextStyle(fontSize: 50)),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 2
                    children: [
                      Container(),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/jpoint.jpg', height: 200),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 7),
                        child:
                            Image.asset('assets/emptyheart.png', height: 100),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 3
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Text('Lota????o: ',
                            style: TextStyle(fontSize: 25)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: const Text('0 ', style: TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 4
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Text('M??ximo: ',
                            style: TextStyle(fontSize: 25)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: const Text('0 ', style: TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 5 google
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          'assets/gpointMap.PNG',
                          height: 168,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
