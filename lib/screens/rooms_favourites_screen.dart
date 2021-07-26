import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../widgets/room_item.dart';
import '../providers/rooms_provider.dart';

// ignore: must_be_immutable
class RoomsFavouritesScreen extends StatelessWidget {
  var favouriteRooms = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final roomProvider = Provider.of<Rooms>(context);
    // roomProvider.fetchAndSetFavs();
    while (count < 1) {
      roomProvider.fetchAndSetFavs();
      count++;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('allRooms').get(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> displayedRooms = snapshot.data.docs;
              if (displayedRooms.length == 0) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      'No data has been added for this building yet. Try another building.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else {
                if (roomProvider.favRooms.isNotEmpty) {
                  List<DocumentSnapshot<Object>> favRooms = [];
                  for (int i = 0; i < displayedRooms.length; i++) {
                    if (roomProvider.isRoomFav(displayedRooms[i]['name'])) {
                      favRooms.add(displayedRooms[i]);
                    }
                  }
                  return ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: favRooms
                            .map((room) => RoomItem(
                                  selectedRoom: room,
                                ))
                            .toList(),
                      ),
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'No rooms favourited yet.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              }
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
