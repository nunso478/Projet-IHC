import 'package:flutter/material.dart';

import 'model/model.dart';
import 'package:sliding_navigation_drawer/home.dart';

class SideMenu extends StatefulWidget {
  final Function(int) _onMenuItemSelection;

  SideMenu({
    @required Function onMenuItemSelection,
  }) : _onMenuItemSelection = onMenuItemSelection;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text('Raul Rodrigues'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          'assets/tele.jpeg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              menuItems[index].menuIcon,
                              color: index == _currentPage
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                            SizedBox(width: 16),
                            Text(
                              menuItems[index].menuName,
                              style: TextStyle(
                                color: index == _currentPage
                                    ? Colors.blue
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          widget._onMenuItemSelection(index);
                          setState(() {
                            _currentPage = index;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          });
                        },
                      ),
                    );
                  },
                  itemCount: menuItems.length,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
