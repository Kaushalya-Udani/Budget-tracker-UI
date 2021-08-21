import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget_tracker/pages/root_app/daily_page.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:ionicons/ionicons.dart';
class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}
class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setectedTabs(4);
        },
        child: Icon(Icons.add, size: 25),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Widget getBody() {
    return IndexedStack(index: pageIndex, children: [
      DailyPage(),
      Center(
        child: Text("Stats Page"),
      ),
      Center(
        child: Text("Create budget Page"),
      ),
      Center(
        child: Text("Budget Page"),
      ),
      Center(
        child: Text("Profile Page"),
      ),
    ]);
  }
  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.calendar_number,
      Ionicons.star,
      Ionicons.wallet,
      Ionicons.person,
    ];
    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        onTap: (index) {
          setectedTabs(index);
        });
  }
  setectedTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}