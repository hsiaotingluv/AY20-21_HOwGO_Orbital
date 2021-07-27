import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sizer/sizer.dart';

import '../widgets/navigation_bar.dart';
import '../widgets/room_item.dart';

class RoomScreen extends StatelessWidget {
  static const routeName = '/room';

  final String campus;
  final String faculty;
  final String building;

  RoomScreen({
    this.campus,
    this.faculty,
    this.building,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Room'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection(
                  'campus/$campus/faculty/$faculty/building/$building/room')
              .get(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> displayedRooms = snapshot.data.docs;
              return displayedRooms.length == 0
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'No data has been added for this building yet. Try another building.',
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: displayedRooms
                              .map((room) => RoomItem(
                                    selectedRoom: room,
                                  ))
                              .toList(),
                        ),
                      ],
                    );
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
      bottomNavigationBar: NavigationBar(0),
    );
  }
}
