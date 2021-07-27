// import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:howgo/providers/rooms_provider.dart';
import 'package:howgo/providers/study_areas_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
    final roomsProvider = Provider.of<Rooms>(context, listen: true);
    final studyAreaProvider = Provider.of<StudyAreas>(context, listen: false);
    roomsProvider.fetchAndSetFavs();
    studyAreaProvider.fetchAndSetFavs();
    final noOfStudyAreasFav = studyAreaProvider.noDuplicates.length;
    final noOfRoomFav = roomsProvider.noDuplicates.length;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favourites'),
          bottom: TabBar(
            automaticIndicatorColorAdjustment: true,
            indicatorWeight: 3.0,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white38,
            tabs: [
              SizedBox(
                height: 4.h,
                child: Tab(
                  // text: 'Rooms',
                  child: Text(
                    'Rooms ($noOfRoomFav)',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                  // icon: Icon(
                  //   Platform.isIOS
                  //       ? CupertinoIcons.book
                  //       : Icons.menu_book_rounded,
                  //   size: 30,
                  // ),
                  // text: 'Rooms',
                ),
              ),
              SizedBox(
                height: 4.h,
                child: Tab(
                  // text: 'StudySpots',
                  child: Text(
                    'StudySpots ($noOfStudyAreasFav)',
                    style: TextStyle(fontSize: 13.sp),
                  ),

                  // icon: Icon(
                  //   Icons.school_outlined,
                  //   size: 30,
                  // ),
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
