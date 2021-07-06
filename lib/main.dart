import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './category_data.dart';
import './models/building.dart';
import './models/faculty.dart';
import './models/room.dart';
import './providers/rooms_provider.dart';
import './providers/lesson_provider.dart';
import './providers/profile_providers.dart';
import './providers/theme_provider.dart';
import './providers/study_areas_provider.dart';
import './screens/maps_screen.dart';
import './screens/settings_screen.dart';
import './screens/timetable_screen.dart';
import './screens/faculty_screen.dart';
import './screens/room_detail_screen.dart';
import './screens/room_screen.dart';
import './screens/building_screen.dart';
import './screens/campus_screen.dart';
import './screens/favourites_tabs_screen.dart';
import './screens/search_screen.dart';
import './screens/study_area_detail_screen.dart';
import './screens/study_area_screen.dart';

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
          create: (ctx) => ThemeSettings(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Lessons(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Profiles(),
        ),
      ],
      builder: (context, child) {
        final settings = Provider.of<ThemeSettings>(context);
        return MaterialApp(
          title: 'HOwGO',
          // theme: ThemeData(
          // primaryColor: settings.darkMode ? Colors.black : Colors.orange,
          // backgroundColor: Colors.white,
          // ),
          // themeMode: settings.themeMode,
          // themeMode: ThemeMode.dark,
          theme: settings.darkTheme ? darkTheme : lightTheme,
          // darkTheme: darkTheme,
          home: CampusScreen(),
          // initialRoute: '/',
          routes: {
            // '/': (ctx) => TabsScreen(),
            FacultyScreen.routeName: (ctx) =>
                FacultyScreen(availableFaculty: _availableFaculties),
            BuildingScreen.routeName: (ctx) =>
                BuildingScreen(_availableBuildings),
            RoomScreen.routeName: (ctx) => RoomScreen(_availableRooms),
            RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(),
            StudyAreaDetailScreen.routeName: (ctx) => StudyAreaDetailScreen(),
            TimetableScreen.routeName: (ctx) => TimetableScreen(),
            MapsScreen.routeName: (ctx) => MapsScreen(),
            SettingsScreen.routeName: (ctx) => SettingsScreen(),
            CampusScreen.routeName: (ctx) => CampusScreen(),
            SearchScreen.routeName: (ctx) => SearchScreen(),
            FavouritesTabsScreen.routeName: (ctx) => FavouritesTabsScreen(),
            StudyAreasScreen.routeName: (ctx) => StudyAreasScreen(),
          },
        );
      },
    );
  }
}
