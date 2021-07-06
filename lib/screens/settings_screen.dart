import 'package:flutter/material.dart';
import 'package:howgo/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context);
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
              height: 75,
              child: SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText2.color,
                  ),
                ),
                value: settings.darkTheme,
                onChanged: (newValue) {
                  setState(() {
                    settings.toggleTheme();
                  });
                },
              ),
              padding: EdgeInsets.only(top: 15, left: 25),
            ),
            Divider(
              height: 9,
              indent: 10,
              endIndent: 10,
              thickness: 1.5,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(5),
    );
  }
}
