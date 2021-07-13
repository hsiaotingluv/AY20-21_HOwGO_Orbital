import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/rooms_favourites_screen.dart';
import '../screens/study_area_favourites_screen.dart';
import '../widgets/navigation_bar.dart';
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
              SizedBox(
                height: 40,
                child: Tab(
                  icon: Icon(
                    Platform.isIOS
                        ? CupertinoIcons.book
                        : Icons.menu_book_rounded,
                    size: 30,
                  ),
                  // text: 'Rooms',
                ),
              ),
              SizedBox(
                height: 40,
                child: Tab(
                  icon: Icon(
                    Icons.school_outlined,
                    size: 30,
                  ),
                  // text: 'StudySpots',
                ),
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
        bottomNavigationBar: NavigationBar(2),
      ),
    );
  }
}
