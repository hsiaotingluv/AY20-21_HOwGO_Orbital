import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/campus_screen.dart';
import '../screens/favourites_tabs_screen.dart';
import '../screens/search_screen.dart';
import '../screens/study_area_screen.dart';

class NavigationBar extends StatefulWidget {
  int pageNo;
  NavigationBar(this.pageNo);

  @override
  _NavigationBarState createState() => _NavigationBarState(pageNo);
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedPageIndex = 0;

  int pageNo;
  _NavigationBarState(this.pageNo);

  List<Map<String, Object>> _pages = [
    {
      'page': CampusScreen(),
      'title': 'Campus',
    },
    {
      'page': SearchScreen(),
      'title': 'All Rooms',
    },
    {
      'page': FavouritesTabsScreen(),
      'title': 'Favourite',
    },
    {
      'page': StudyAreasScreen(),
      'title': 'Study Area',
    },
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    if (_selectedPageIndex == 0) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => CampusScreen(),
          transitionDuration: Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 1) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => SearchScreen(),
          transitionDuration: Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 2) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              FavouritesTabsScreen(),
          transitionDuration: Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 3) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => StudyAreasScreen(),
          transitionDuration: Duration(seconds: 2),
        ),
      );
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        showUnselectedLabels: true,
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 22.sp,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              pageNo == 0 ? Icons.explore : Icons.explore_outlined,
              color: pageNo == 0
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Explore',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 0,
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              pageNo == 1
                  ? Platform.isIOS
                      ? CupertinoIcons.search
                      : Icons.search
                  : Platform.isIOS
                      ? CupertinoIcons.search
                      : Icons.search_outlined,
              color: pageNo == 1
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Search',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 0,
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              pageNo == 2
                  ? Platform.isIOS
                      ? CupertinoIcons.heart_fill
                      : Icons.favorite
                  : Platform.isIOS
                      ? CupertinoIcons.heart
                      : Icons.favorite_border,
              color: pageNo == 2
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Favourites',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 0,
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              pageNo == 3 ? Icons.school : Icons.school_outlined,
              color: pageNo == 3
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Study Areas',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 0,
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
        ],
      ),
    );
  }
}
