import 'package:flutter/material.dart';
import './models/faculty.dart';
import './screens/faculty_screen.dart';

import './screens/room_detail_screen.dart';
import './screens/tabs_screen.dart';
import './category_data.dart';
import './models/building.dart';
// import './models/campus.dart';
import './models/room.dart';
// import './screens/campus_screen.dart';
import './screens/building_screen.dart';
import './screens/room_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<Campus> _availableCampus = CAMPUS_CATEGORIES;
  List<Building> _availableBuildings = BUILDING_CATEGORIES;
  List<Faculty> _availableFaculties = FACULTY_CATEGORIES;
  List<Room> _availableRooms = ROOMS;
  List<Room> _favouriteRooms = [];

  void _toggleFavourite(String roomName) {
    print(_favouriteRooms.length);
    final existingIndex =
        _favouriteRooms.indexWhere((r) => r.title == roomName);
    if (existingIndex >= 0) {
      print('fav removed');
      setState(() {
        _favouriteRooms.removeAt(existingIndex);
      });
    } else {
      print('fav added');
      setState(() {
        _favouriteRooms.add(
          ROOMS.firstWhere((r) => r.title == roomName),
        );
      });
    }
    print(_favouriteRooms.length);
  }

  bool _isRoomFavourite(String roomName) {
    return _favouriteRooms.any((r) => r.title == roomName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOwGO',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: CampusScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(
              _favouriteRooms,
              _toggleFavourite,
              _isRoomFavourite,
            ),
        BuildingScreen.routeName: (ctx) => BuildingScreen(_availableBuildings),
        FacultyScreen.routeName: (ctx) => FacultyScreen(_availableFaculties),
        RoomScreen.routeName: (ctx) => RoomScreen(
              _availableRooms,
              _toggleFavourite,
              _isRoomFavourite,
            ),
        RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(
              _toggleFavourite,
              _isRoomFavourite,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => TabsScreen(
            _favouriteRooms,
            _toggleFavourite,
            _isRoomFavourite,
          ),
        );
      },
    );
  }
}
