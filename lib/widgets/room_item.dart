import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../providers/rooms_provider.dart';
import '../screens/room_detail_screen.dart';

// ignore: must_be_immutable
class RoomItem extends StatelessWidget {
  final String title;
  final String location;
  final String building;

  bool gridView;

  RoomItem({
    @required this.title,
    @required this.location,
    @required this.building,
    this.gridView = false,
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
    final roomsList = Provider.of<Rooms>(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          iconWidget: Icon(
            Icons.favorite,
            size: 30,
          ),
          caption: 'Favourite',
          color: Colors.blueAccent.shade200,
          // icon: Icons.favorite,
          closeOnTap: true,
          foregroundColor: Colors.white,
          onTap: () {
            roomsList.toggleFavourite(title);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Room added to favourites'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    roomsList.toggleFavourite(title);
                  },
                ),
              ),
            );
          },
        ),
      ],
      child: Column(
        children: [
          InkWell(
            onTap: () => selectRoom(context),
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(1),
            child: gridView
                ? Container(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: GridTile(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText2.color,
                          ),
                        ),
                        footer: Text(
                          location,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText2.color,
                          ),
                        ),
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
                    padding: const EdgeInsets.all(0),
                    child: ListTile(
                      horizontalTitleGap: 0,
                      title: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyText2.color,
                        ),
                      ),
                      subtitle: Text(
                        location,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).textTheme.bodyText2.color,
                        ),
                      ),
                      // trailing: IconButton(
                      //   icon: Icon(
                      //     roomsList.findByName(title).isFavourite
                      //         ? Icons.star
                      //         : Icons.star_border,
                      //     size: 30,
                      //   ),
                      //   color: Theme.of(context).iconTheme.color,
                      //   splashRadius: 1,
                      //   onPressed: () => roomsList.toggleFavourite(title),
                      // ),
                    ),
                    height: 75,
                  ),
          ),
          Divider(
            height: 0,
            thickness: 1.5,
            color: Theme.of(context).dividerColor,
          ),
        ],
      ),
    );
  }
}
