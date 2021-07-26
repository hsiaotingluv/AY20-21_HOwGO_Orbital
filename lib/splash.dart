import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/home_screen_provider.dart';
import '../screens/favourites_tabs_screen.dart';
import '../screens/campus_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => _navigaiteToHome());
  }

  _navigaiteToHome() async {
    await Future.delayed(Duration(microseconds: 7000), () {});
    final pickedHomeScreen =
        Provider.of<ChooseHomeScreenSettings>(context, listen: false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return pickedHomeScreen.homeScreen
              ? FavouritesTabsScreen()
              : CampusScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Center(
            child: Image.asset('assets/images/icon.png'),
          ),
          height: 40.h,
          width: 40.w,
        ),
      ),
    );
  }
}
