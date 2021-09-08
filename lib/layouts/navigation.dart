import 'package:first_person_twitter/layouts/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyNavigationBar extends StatefulWidget {
  final dob;
  MyNavigationBar({Key key, this.dob}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions;
  @override
  void initState() {
    super.initState();
    debugPrint(widget.dob);
    _widgetOptions = <Widget>[
      Home(
        dob: widget.dob,
      ),
      Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.blue[100],
                size: 150,
              ),
            ),
            Text(
              'Coming Soon',
              style: TextStyle(
                fontFamily: "IBM",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.blue[100],
                size: 150,
              ),
            ),
            Text(
              'Coming Soon',
              style: TextStyle(
                fontFamily: "IBM",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.blue[100],
                size: 150,
              ),
            ),
            Text(
              'Coming Soon',
              style: TextStyle(
                fontFamily: "IBM",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 56,
        child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/image/house.png',
                  ),
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage(
                    'assets/image/housefill.png',
                  ),
                ),
                title: Text(
                  '',
                  style: TextStyle(height: 0),
                ),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/image/search.png',
                  ),
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage(
                    'assets/image/searchfill.png',
                  ),
                ),
                title: Text(
                  '',
                  style: TextStyle(height: 0),
                ),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/image/ring.png',
                  ),
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage(
                    'assets/image/ringfill.png',
                  ),
                ),
                title: Text(
                  '',
                  style: TextStyle(height: 0),
                ),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/image/message.png',
                  ),
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage(
                    'assets/image/messagefill.png',
                  ),
                ),
                title: Text(
                  '',
                  style: TextStyle(height: 0),
                ),
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            iconSize: 22,
            onTap: _onItemTapped,
            elevation: 10),
      ),
    );
  }
}
