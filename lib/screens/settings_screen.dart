import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_screen_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/navigation_bar.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final darkThemeSettings = Provider.of<ThemeSettings>(context);
    final homeScreenSettings = Provider.of<ChooseHomeScreenSettings>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 20,
            ),
            Container(
              child: Text(
                'General',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              margin: EdgeInsets.only(left: 20),
            ),
            Container(
              height: 70,
              child: SwitchListTile(
                title: Text(
                  'Set Favourites as Home Screen',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).textTheme.bodyText2.color,
                  ),
                ),
                value: homeScreenSettings.homeScreen,
                onChanged: (newValue) {
                  setState(() {
                    homeScreenSettings.toggleTheme();
                  });
                },
              ),
              padding: EdgeInsets.only(
                left: 25,
                top: 8,
              ),
            ),
            Divider(
              height: 9,
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
            Container(
              height: 20,
            ),
            Container(
              child: Text(
                'Display',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              margin: EdgeInsets.only(left: 20),
            ),
            Container(
              height: 70,
              child: SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).textTheme.bodyText2.color,
                  ),
                ),
                value: darkThemeSettings.darkTheme,
                onChanged: (newValue) {
                  setState(() {
                    darkThemeSettings.toggleTheme();
                  });
                },
              ),
              padding: EdgeInsets.only(
                left: 25,
                top: 8,
              ),
            ),
            Divider(
              height: 9,
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(5),
    );
  }
}
