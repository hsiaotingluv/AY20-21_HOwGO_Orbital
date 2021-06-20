import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/rooms_provider.dart';
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
          room.name == roomTitle &&
          room.location == roomLocation &&
          room.building == roomBuilding,
    );
    final roomsList = Provider.of<Rooms>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedRoom.name}'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          Container(
            child: Text(
              'Images go here...',
              style: TextStyle(fontSize: 30),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(20),
            child: Text(
              'Room: $roomTitle \n'
              'Location: $roomLocation \n'
              'Capacity: ${selectedRoom.capacity} \n'
              'Nearby Bus Stops: ${selectedRoom.nearbyBusStops} \n'
              'Address: ${selectedRoom.address}',
              style: TextStyle(fontSize: 20),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          roomsList.findByName(roomTitle).isFavourite
              ? Icons.star
              : Icons.star_border,
        ),
        onPressed: () => roomsList.toggleFavourite(roomTitle),
      ),
    );
  }
}
