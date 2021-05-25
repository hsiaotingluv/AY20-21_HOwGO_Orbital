import 'package:flutter/material.dart';

import '../models/room.dart';
import '../screens/room_detail_screen.dart';

class RoomItem extends StatelessWidget {
  final String title;
  final String location;
  final String building;

  RoomItem({
    @required this.title,
    @required this.location,
    @required this.building,
  });

  void selectRoom(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(RoomDetailScreen.routeName, arguments: {
      'title': title,
      'location': location,
      'building': building,
    }).then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectRoom(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: ListTile(
          title: Text(title),
          subtitle: Text(location),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
