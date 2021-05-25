import 'package:flutter/material.dart';

import '../widgets/room_item.dart';
import '../models/room.dart';

class RoomScreen extends StatefulWidget {
  static const routeName = '/room';

  final List<Room> availableRooms;

  RoomScreen(this.availableRooms);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  String buildingTitle;
  List<Room> displayedRooms;
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
      buildingTitle = routeArgs['title'];
      displayedRooms = widget.availableRooms.where((room) {
        return room.building.contains(buildingTitle);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Room'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemBuilder: (ctx, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            child: RoomItem(
              title: displayedRooms[index].title,
              location: displayedRooms[index].location,
              building: displayedRooms[index].building,
            ),
          );
        },
        itemCount: displayedRooms.length,
      ),
    );
  }
}
