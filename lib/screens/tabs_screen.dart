import 'package:flutter/material.dart';

import '../models/room.dart';
import './maps_screen.dart';
import './favourites_screen.dart';
import './timetable_screen.dart';
import './campus_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Room> favouriteRooms;
  final Function toggleFavourite;
  final Function isFavourite;

  TabsScreen(this.favouriteRooms, this.toggleFavourite, this.isFavourite);

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
      },
      {
        'page': FavouritesScreen(
            widget.favouriteRooms, widget.toggleFavourite, widget.isFavourite),
        'title': 'Favourite',
      },
      {
        'page': TimetableScreen(),
        'title': 'My Timetable',
      },
      {
        'page': MapsScreen(),
        'title': 'Map',
      }
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
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      // body: _pages[_selectedPageIndex]['page'],
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.pink,
        iconSize: 30.0,
        selectedIconTheme: IconThemeData(size: 38),
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            title: Text('Favourites'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            title: Text('My Timetable'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            title: Text('Map'),
          ),
        ],
      ),
    );
  }
}
