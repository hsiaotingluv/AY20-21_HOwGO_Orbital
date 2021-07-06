import 'package:flutter/material.dart';

import '../screens/rooms_favourites_screen.dart';
import '../screens/study_area_favourites_screen.dart';
import '../widgets/main_drawer.dart';

class FavouritesTabsScreen extends StatefulWidget {
  static const routeName = '/favouritesTabsScreen';
  @override
  _FavouritesTabsScreenState createState() => _FavouritesTabsScreenState();
}

class _FavouritesTabsScreenState extends State<FavouritesTabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favourites'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.menu_book_rounded),
                text: 'Rooms',
              ),
              Tab(
                icon: Icon(Icons.school_outlined),
                text: 'StudySpots',
              ),
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: [
            RoomsFavouritesScreen(),
            StudyAreaFavouritesScreen(),
          ],
        ),
      ),
    );
  }
}
