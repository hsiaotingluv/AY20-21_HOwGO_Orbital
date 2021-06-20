import 'package:flutter/material.dart';

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
          padding: EdgeInsets.only(
            top: 10,
          ),
          height: 75,
          child: ListTile(
            leading: Icon(
              icon,
              size: 26,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                // color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: tapHandler,
          ),
        ),
        Divider(
          height: 0,
          thickness: 0.2,
          color: Colors.grey,
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
            height: 150,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 90,
                    left: 20,
                  ),
                  height: 150,
                  width: 192,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'NUS HOwGO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                ),
                Container(
                  width: 112,
                  height: 150,
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 70.0,
                      right: 15.0,
                      left: 15.0,
                      bottom: 10.0,
                    ),
                    child: CircleAvatar(
                      maxRadius: 12,
                      backgroundImage: AssetImage('assets/images/lzw.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildListTile(
            context,
            'Settings',
            Icons.settings,
            () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
          ),
          buildListTile(
            context,
            'Timetable',
            Icons.calendar_today_outlined,
            () {
              Navigator.of(context).pushNamed(TimetableScreen.routeName);
            },
          ),
          buildListTile(
            context,
            'Map',
            Icons.map_outlined,
            () {
              Navigator.of(context).pushNamed(MapsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
