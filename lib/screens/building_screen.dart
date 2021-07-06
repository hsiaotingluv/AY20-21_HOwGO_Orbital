import 'package:flutter/material.dart';
import 'package:howgo/screens/search_screen.dart';
import 'package:howgo/screens/study_area_screen.dart';
import 'package:howgo/widgets/navigation_bar.dart';

import '../widgets/building_item.dart';
import '../models/building.dart';
import 'campus_screen.dart';
import 'favourites_tabs_screen.dart';

class BuildingScreen extends StatefulWidget {
  static const routeName = '/building';

  final List<Building> availableBuildings;

  BuildingScreen(this.availableBuildings);

  @override
  _BuildingScreenState createState() => _BuildingScreenState();
}

class _BuildingScreenState extends State<BuildingScreen> {
  String facultyTitle;
  List<Building> displayedBuildings;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      facultyTitle = routeArgs['title'];
      displayedBuildings = widget.availableBuildings.where((building) {
        return building.faculty.contains(facultyTitle);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Building'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: displayedBuildings.length == 0
          ? Center(
              child: Text(
                'No data has been added for this faculty yet. Try another faculty.',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return BuildingItem(
                  title: displayedBuildings[index].title,
                  campus: displayedBuildings[index].campus,
                );
              },
              itemCount: displayedBuildings.length,
              padding: EdgeInsets.all(5),
            ),
      bottomNavigationBar: NavigationBar(0),
    );
  }
}
