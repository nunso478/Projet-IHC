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
      home: MyDubai(),
    );
  }
}

class MyDubai extends StatefulWidget {
  @override
  _MyDubaiState createState() => _MyDubaiState();
}

class _MyDubaiState extends State<MyDubai> with SingleTickerProviderStateMixin {
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
                        margin: const EdgeInsets.only(left: 115),
                        child:
                            const Text('Dubai', style: TextStyle(fontSize: 50)),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 2
                    children: [
                      Container(),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/dubai.jfif'),
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
                        child: const Text('Lotação: ',
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
                        child: const Text('Lotação: ',
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
                        color: Colors.orange,
                        margin: EdgeInsets.all(25.0),
                        child: FlutterLogo(
                          size: 60.0,
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        margin: EdgeInsets.all(25.0),
                        child: FlutterLogo(
                          size: 60.0,
                        ),
                      ),
                      Container(
                        color: Colors.purple,
                        margin: EdgeInsets.all(25.0),
                        child: FlutterLogo(
                          size: 60.0,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            )
          ],
        ),
        backgroundColor: Colors.black45,
      ),
    );
  }
}
