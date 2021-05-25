import 'package:flutter/material.dart';

import './screens/room_detail_screen.dart';
import './category_data.dart';
import './models/building.dart';
import './models/campus.dart';
import './models/room.dart';
import './screens/campus_screen.dart';
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
  List<Campus> _availableCampus = CAMPUS_CATEGORIES;
  List<Building> _availableBuildings = BUILDING_CATEGORIES;
  List<Room> _availableRooms = ROOMS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOwGO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: CampusScreen(),
      initialRoute: '/',
      routes: {
        BuildingScreen.routeName: (ctx) => BuildingScreen(_availableBuildings),
        RoomScreen.routeName: (ctx) => RoomScreen(_availableRooms),
        RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CampusScreen(),
        );
      },
    );
  }
}
