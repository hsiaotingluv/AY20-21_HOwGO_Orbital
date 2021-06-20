import 'package:flutter/material.dart';
import 'package:howgo/providers/lesson_provider.dart';
import 'package:howgo/providers/profile_providers.dart';
import 'package:howgo/providers/settings_provider.dart';
import 'package:howgo/providers/study_areas_provider.dart';
import 'package:howgo/screens/maps_screen.dart';
import 'package:howgo/screens/settings_screen.dart';
import 'package:howgo/screens/timetable_screen.dart';
import 'package:provider/provider.dart';

import './category_data.dart';
import '../models/building.dart';
import '../models/faculty.dart';
import '../models/room.dart';
import '../providers/rooms_provider.dart';
import '../screens/faculty_screen.dart';
import '../screens/room_detail_screen.dart';
import '../screens/room_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/building_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with ChangeNotifier {
  List<Building> _availableBuildings = BUILDING_CATEGORIES;
  List<Faculty> _availableFaculties = FACULTY_CATEGORIES;
  List<Room> _availableRooms = ROOMS;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Rooms(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => StudyAreas(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MyApp(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Settings(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Lessons(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Profiles(),
        ),
      ],
      builder: (context, child) {
        final settings = Provider.of<Settings>(context);
        return MaterialApp(
          title: 'HOwGO',
          // theme: ThemeData(
          // primaryColor: settings.darkMode ? Colors.black : Colors.orange,
          // backgroundColor: Colors.white,
          // ),
          themeMode: settings.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: TabsScreen(),
          initialRoute: '/',
          routes: {
            // '/': (ctx) => TabsScreen(),
            FacultyScreen.routeName: (ctx) =>
                FacultyScreen(_availableFaculties),
            BuildingScreen.routeName: (ctx) =>
                BuildingScreen(_availableBuildings),
            RoomScreen.routeName: (ctx) => RoomScreen(_availableRooms),
            RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(),
            TimetableScreen.routeName: (ctx) => TimetableScreen(),
            MapsScreen.routeName: (ctx) => MapsScreen(),
            SettingsScreen.routeName: (ctx) => SettingsScreen(),
          },
        );
      },
      // child: MaterialApp(
      //   title: 'HOwGO',
      //   theme: ThemeData(
      //     primaryColor: Colors.orange,
      //     backgroundColor: Colors.white,
      //   ),
      //   home: TabsScreen(),
      //   initialRoute: '/',
      //   routes: {
      //     // '/': (ctx) => TabsScreen(),
      //     FacultyScreen.routeName: (ctx) => FacultyScreen(_availableFaculties),
      //     BuildingScreen.routeName: (ctx) =>
      //         BuildingScreen(_availableBuildings),
      //     RoomScreen.routeName: (ctx) => RoomScreen(_availableRooms),
      //     RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(),
      //     TimetableScreen.routeName: (ctx) => TimetableScreen(),
      //     MapsScreen.routeName: (ctx) => MapsScreen(),
      //     SettingsScreen.routeName: (ctx) => SettingsScreen(),
      //   },
      // ),
    );
  }
}
