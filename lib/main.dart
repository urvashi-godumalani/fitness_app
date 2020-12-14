import 'package:fitness_app/screens/Activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'configuration.dart';
import 'package:fitness_app/screens/Dashboard.dart';
import 'package:fitness_app/screens/Feed.dart';
import 'package:fitness_app/screens/Settings.dart';
import 'package:fitness_app/screens/AddPost.dart';
import 'package:fitness_app/screens/Notifications.dart';

void main() {
  runApp(MyApp());
}

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: bottomNavColor,
        accentColor: Color(0xff676767),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: mainNavigatorKey,
      initialRoute: MyHome.id,
      routes: {
        MyHome.id: (context) => MyHome(),
        Settings.id: (context) => Settings(),
        AddPost.id: (context) => AddPost(),
      },
    );
  }
}

class MyHome extends StatefulWidget {
  static final String id = 'my_home';

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  PageController _pageController;
  bool userPageDragging = false;
  int bottomCurrentIndex = 0;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    super.initState();
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fitness'),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Welcome user',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                title: Text('About us'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Privacy Policy'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: bottomNavColor,
        currentIndex: bottomCurrentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            bottomCurrentIndex = index;
          });
        },
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard,
                  size: bottomNavIconSize, color: Colors.black45),
              activeIcon: Icon(Icons.dashboard,
                  size: bottomNavIconSize, color: bottomNavColor),
              label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/running.png"),
                color: Colors.black45,
                size: 23,
              ), //
              activeIcon: ImageIcon(
                AssetImage("assets/images/running.png"),
                color: bottomNavColor,
                size: 23,
              ),
              label: 'Running'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections,
                  size: bottomNavIconSize, color: Colors.black45),
              activeIcon: Icon(Icons.collections,
                  size: bottomNavIconSize, color: bottomNavColor),
              label: 'Feed'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,
                size: bottomNavIconSize, color: Colors.black45),
            activeIcon: Icon(Icons.notifications,
                size: bottomNavIconSize, color: bottomNavColor),
            label: 'Notifications',
          ),
        ],
      ),
      floatingActionButton: bottomCurrentIndex == 2
          ? FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: bottomNavColor,
              onPressed: () {
                Navigator.pushNamed(context, AddPost.id);
              },
            )
          : null,
      body: NotificationListener<ScrollNotification>(
        // ignore: missing_return
        onNotification: (scrollNotification) {
          checkUserDragging(scrollNotification);
        },
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            Dashboard(),
            Activity(),
            Feed(),
            Notifications(),
          ],
          onPageChanged: (page) {
            setState(() {
              bottomCurrentIndex = page;
            });
          },
        ),
      ),
    );
  }
}
