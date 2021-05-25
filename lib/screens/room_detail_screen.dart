import 'package:flutter/material.dart';

import '../category_data.dart';

class RoomDetailScreen extends StatelessWidget {
  static const routeName = '/room-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final roomTitle = routeArgs['title'];
    final roomLocation = routeArgs['location'];
    final roomBuilding = routeArgs['building'];
    final selectedRoom = ROOMS.firstWhere(
      (room) =>
          room.title == roomTitle &&
          room.location == roomLocation &&
          room.building == roomBuilding,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedRoom.title}'),
        // centerTitle: true,
        // bottom: PreferredSize(
        //   child: Text(roomLocation),
        //   preferredSize: null,
      ),
      // ),
      body: Text('Address: ${selectedRoom.address} \n'
          'Nearby Bus Stops: ${selectedRoom.nearbyBusStops} \n'
          'Location: ${roomLocation} \n'
          'Capacity: ${selectedRoom.capacity}'),
    );
  }
}
