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
      home: MyFavorites(),
    );
  }
}

class MyFavorites extends StatefulWidget {
  @override
  _MyFavoritesState createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites>
    with SingleTickerProviderStateMixin {
  int currentPage = 1;
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
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text('FAVORITOS',
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
                        child: Image.asset(
                          'assets/dubai.jfif',
                          width: 90,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text('Lotação: ',
                            style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: const Text('0 ', style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 90),
                        child: Image.asset('assets/likeicon.png', height: 20),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 2
                    children: [
                      Container(),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/living.png',
                          width: 90,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text('Lotação: ',
                            style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: const Text('0 ', style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 90),
                        child: Image.asset('assets/likeicon.png', height: 20),
                      ),
                    ],
                  ),
                ]),
              ),
            )
          ],
        ),
        //backgroundColor: Colors.black45,
      ),
    );
  }
}
