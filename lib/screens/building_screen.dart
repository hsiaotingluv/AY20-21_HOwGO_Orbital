import 'package:flutter/material.dart';

import '../widgets/building_item.dart';
import '../models/building.dart';

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
  void initState() {
    // ...
    super.initState();
  }

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
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return BuildingItem(
            title: displayedBuildings[index].title,
            campus: displayedBuildings[index].campus,
          );
        },
        itemCount: displayedBuildings.length,
        padding: EdgeInsets.all(5),
      ),
    );
  }
}
