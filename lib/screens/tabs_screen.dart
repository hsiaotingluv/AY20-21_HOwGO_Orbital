import 'package:flutter/material.dart';

import './campus_screen.dart';
import './favourites_tabs_screen.dart';
import './search_screen.dart';
import './study_area_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CampusScreen(),
        'title': 'Campus',
        // 'appBar':,
      },
      {
        'page': SearchScreen(),
        'title': 'All Rooms',
        // 'appBar':,
      },
      {
        'page': FavouritesTabsScreen(),
        'title': 'Favourite',
        // 'appBar':,
      },
      {
        'page': StudyAreasScreen(),
        'title': 'Study Area',
        // 'appBar':,
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          onTap: _selectPage,
          unselectedItemColor: Theme.of(context).iconTheme.color,
          selectedItemColor: Theme.of(context).primaryColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 30.0,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(_selectedPageIndex == 0
                  ? Icons.explore
                  : Icons.explore_outlined),
              label: 'Explore',
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedPageIndex == 1
                  ? Icons.search
                  : Icons.search_outlined),
              label: 'Search',
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedPageIndex == 2 ? Icons.star : Icons.star_border),
              label: 'Favourites',
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedPageIndex == 3
                  ? Icons.school
                  : Icons.school_outlined),
              label: 'Study Areas',
              backgroundColor: Theme.of(context).backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
