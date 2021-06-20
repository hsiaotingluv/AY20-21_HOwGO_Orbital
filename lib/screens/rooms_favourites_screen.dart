import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/rooms_provider.dart';
import '../models/room.dart';
import '../widgets/room_item.dart';

class RoomsFavouritesScreen extends StatelessWidget {
  var favouriteRooms = [];
  Scaffold showListView(List<Room> favouriteRooms, Color bgrColor) {
    return Scaffold(
      backgroundColor: bgrColor,
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemBuilder: (ctx, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            child: RoomItem(
              title: favouriteRooms[index].name,
              location: favouriteRooms[index].location,
              building: favouriteRooms[index].building,
              gridView: false,
            ),
          );
        },
        itemCount: favouriteRooms.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final roomList = Provider.of<Rooms>(context);
    final bgrColor = Theme.of(context).backgroundColor;
    if (roomList.favouriteRooms.isEmpty) {
      return Scaffold(
        backgroundColor: bgrColor,
        body: Center(
          child: Text(
            'You have no favourites yet - start adding some!',
            style: TextStyle(fontSize: 20),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return showListView(roomList.favouriteRooms, bgrColor);
    }
  }
}
