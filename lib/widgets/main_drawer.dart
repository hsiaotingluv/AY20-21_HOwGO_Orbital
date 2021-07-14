import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/maps_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/timetable_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
    BuildContext context,
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // padding: EdgeInsets.symmetric(
          //   vertical: 3,
          // ),
          height: 60,
          child: ListTile(
            leading: Icon(
              icon,
              size: 22.sp,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
            ),
            onTap: tapHandler,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 70,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.map_rounded,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'NUS HOwGO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile(
            context,
            'Timetable',
            Icons.calendar_today_outlined,
            () {
              Navigator.of(context).pushNamed(TimetableScreen.routeName);
            },
          ),
          // buildListTile(
          //   context,
          //   'Map',
          //   Icons.map_outlined,
          //   () {
          //     Navigator.of(context).pushNamed(MapsScreen.routeName);
          //   },
          // ),
          buildListTile(
            context,
            'Settings',
            Platform.isIOS ? CupertinoIcons.gear_alt : Icons.settings,
            () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
