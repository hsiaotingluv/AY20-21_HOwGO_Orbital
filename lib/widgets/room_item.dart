import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/rooms_provider.dart';
import '../screens/room_detail_screen.dart';

// ignore: must_be_immutable
class RoomItem extends StatelessWidget {
  final DocumentSnapshot<Object> selectedRoom;

  RoomItem({
    @required this.selectedRoom,
  });

  void selectRoom(BuildContext ctx) {
    // Navigator.of(ctx).pushNamed(RoomDetailScreen.routeName, arguments: {
    //   'title': title,
    //   'location': location,
    //   'building': building,
    // }).then((result) {
    //   if (result != null) {
    //     // removeItem(result);
    //   }
    // });
    Navigator.push(
      ctx,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => RoomDetailScreen(
          selectedRoom: selectedRoom,
        ),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  Widget buildIconTile(BuildContext context, IconData icon, String title) {
    return Container(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          SizedBox(
            width: 2,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final roomsList = Provider.of<Rooms>(context, listen: false);
    // bool isFav = roomsList.findFavByName(room);
    // return Slidable(
    //   actionPane: SlidableDrawerActionPane(),
    // secondaryActions: [
    //   Consumer<Rooms>(
    //     builder: (ctx, roomsList, child) => IconSlideAction(
    //       icon: isFav ? Icons.favorite : Icons.favorite_border,
    //       caption: 'Favourite',
    //       color: Theme.of(context).primaryColor,
    //       closeOnTap: true,
    //       foregroundColor: Colors.white,
    //       onTap: () {
    //         roomsList.toggleFavourite(room);
    //         roomsList.fetchAndSetFavs();
    //         ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(
    //             content: !isFav
    //                 ? Text('Room added to favourites')
    //                 : Text('Room removed from favourites'),
    //             duration: Duration(seconds: 2),
    //             action: SnackBarAction(
    //               label: 'UNDO',
    //               textColor: Colors.cyan,
    //               onPressed: () {
    //                 roomsList.toggleFavourite(room);
    //                 roomsList.fetchAndSetFavs();
    //               },
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // ],

    return Column(
      children: [
        Container(
          height: 100,
          child: InkWell(
            onTap: () => selectRoom(context),
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(1),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    selectedRoom['coverphoto'],
                    height: 90,
                    width: 110,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          selectedRoom['name'],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                        Text(
                          selectedRoom['location'],
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Row(
                            children: [
                              buildIconTile(
                                context,
                                Icons.group_rounded,
                                'x${selectedRoom['capacity']}',
                              ),
                              SizedBox(width: 10),
                              buildIconTile(
                                context,
                                Icons.directions_bus_rounded,
                                selectedRoom['nearbyBusStops'],
                              ),
                            ],
                          ),
                        ),
                        // buildIconTile(
                        //   context,
                        //   Icons.router_rounded,
                        //   selectedRoom['facilities'],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              height: 70,
            ),
          ),
        ),
        Divider(
          height: 0,
          thickness: 0.5,
          color: Theme.of(context).dividerColor,
          indent: 15,
          endIndent: 15,
        ),
      ],
      // ),
    );
  }
}
