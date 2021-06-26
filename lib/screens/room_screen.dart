import 'package:flutter/material.dart';

import '../models/room.dart';
import '../widgets/room_item.dart';

enum ViewOptions {
  Grid,
  List,
}

class RoomScreen extends StatefulWidget {
  static const routeName = '/room';

  final List<Room> availableRooms;

  RoomScreen(
    this.availableRooms,
  );

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

  bool gridView = false;
  @override
  Widget build(BuildContext context) {
    List<Room> availRooms = displayedRooms;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Room'),
        actions: [
          PopupMenuButton(
            onSelected: (ViewOptions view) {
              setState(() {
                if (view == ViewOptions.Grid) {
                  gridView = true;
                } else {
                  gridView = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Grid View'),
                value: ViewOptions.Grid,
              ),
              PopupMenuItem(
                child: Text('List View'),
                value: ViewOptions.List,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: showListView(displayedRooms),
      // backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  ListView showListView(List<Room> displayedRoom) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      itemBuilder: (ctx, index) {
        return Container(
          padding: const EdgeInsets.all(5),
          child: RoomItem(
            title: displayedRooms[index].name,
            location: displayedRooms[index].location,
            building: displayedRooms[index].building,
            gridView: gridView,
          ),
        );
      },
      itemCount: displayedRooms.length,
    );
  }

  GridView showGridView(List<Room> availRooms) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: availRooms
          .map(
            (room) => RoomItem(
              title: room.name,
              location: room.location,
              building: room.building,
              gridView: gridView,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
