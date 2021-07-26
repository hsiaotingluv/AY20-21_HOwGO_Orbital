import 'package:flutter/material.dart';
import 'package:howgo/splash.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';

import './providers/home_screen_provider.dart';
import './providers/rooms_provider.dart';
import './providers/theme_provider.dart';
import './providers/study_areas_provider.dart';
import './screens/settings_screen.dart';
import './screens/faculty_screen.dart';
import './screens/room_screen.dart';
import './screens/building_screen.dart';
import './screens/campus_screen.dart';
import './screens/favourites_tabs_screen.dart';
import './screens/search_screen.dart';
import './screens/study_area_detail_screen.dart';
import './screens/study_area_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with ChangeNotifier {
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
          create: (ctx) => ChooseHomeScreenSettings(),
        ),
      ],
      builder: (context, child) {
        final themeSettings = Provider.of<ThemeSettings>(context);
        final pickedHomeScreen = Provider.of<ChooseHomeScreenSettings>(context);
        return Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'HOwGO',
            theme: themeSettings.darkTheme ? darkTheme : lightTheme,
            home: Splash(),

            // pickedHomeScreen.homeScreen
            //     ? FavouritesTabsScreen()
            //     : CampusScreen(),
            routes: {
              FacultyScreen.routeName: (ctx) => FacultyScreen(),
              BuildingScreen.routeName: (ctx) => BuildingScreen(),
              RoomScreen.routeName: (ctx) => RoomScreen(),
              StudyAreaDetailScreen.routeName: (ctx) => StudyAreaDetailScreen(),
              SettingsScreen.routeName: (ctx) => SettingsScreen(),
              CampusScreen.routeName: (ctx) => CampusScreen(),
              SearchScreen.routeName: (ctx) => SearchScreen(),
              FavouritesTabsScreen.routeName: (ctx) => FavouritesTabsScreen(),
              StudyAreasScreen.routeName: (ctx) => StudyAreasScreen(),
            },
          );
        });
      },
    );
  }
}
