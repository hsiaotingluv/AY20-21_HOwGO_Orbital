import 'package:flutter/material.dart';

// import '../models/room.dart';
import '../screens/room_detail_screen.dart';

// ignore: must_be_immutable
class RoomItem extends StatelessWidget {
  final String title;
  final String location;
  final String building;
  final Function toggleFavourite;
  final Function isFavourite;

  bool gridView;

  RoomItem({
    @required this.title,
    @required this.location,
    @required this.building,
    this.gridView = false,
    this.toggleFavourite,
    this.isFavourite,
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
      child: gridView
          ? Container(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: GridTile(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  footer: Text(location),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            )
          : Container(
              padding: const EdgeInsets.all(15),
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  location,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    isFavourite(title) ? Icons.star : Icons.star_border,
                    size: 30,
                  ),
                  color: Colors.blue,
                  onPressed: () => toggleFavourite(title),
                ),
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
