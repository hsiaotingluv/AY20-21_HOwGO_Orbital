import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/room.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/room_item.dart';

// enum ViewOptions {
//   Grid,
//   List,
// }

// class RoomScreen extends StatefulWidget {
//   static const routeName = '/room';

//   final List<RoomModel> availableRooms;

//   RoomScreen(
//     this.availableRooms,
//   );

//   @override
//   _RoomScreenState createState() => _RoomScreenState();
// }

// class _RoomScreenState extends State<RoomScreen> {
//   String buildingTitle;
//   List<RoomModel> displayedRooms;
//   var _loadedInitData = false;

//   @override
//   void initState() {
//     // ...
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     if (!_loadedInitData) {
//       final routeArgs =
//           ModalRoute.of(context).settings.arguments as Map<String, String>;
//       buildingTitle = routeArgs['title'];
//       displayedRooms = widget.availableRooms.where((room) {
//         return room.building.contains(buildingTitle);
//       }).toList();
//       _loadedInitData = true;
//     }
//     super.didChangeDependencies();
//   }

//   bool gridView = false;

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
    // List<RoomModel> availRooms = displayedRooms;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Room'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection(
                  'campus/${campus}/faculty/${faculty}/building/${building}/room')
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
                            fontSize: 20,
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
                          // children: CAMPUS_CATEGORIES
                          //     .map((campus) => CampusItem(campus.name, campus.image))
                          //     .toList(),
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

  // ListView showListView(List<RoomModel> displayedRoom) {
  //   return ListView.builder(
  //     padding: const EdgeInsets.all(5),
  //     itemBuilder: (ctx, index) {
  //       return Container(
  //         padding: const EdgeInsets.all(5),
  //         child: RoomItem(
  //           title: displayedRooms[index].name,
  //           location: displayedRooms[index].location,
  //           building: displayedRooms[index].building,
  //           gridView: gridView,
  //         ),
  //       );
  //     },
  //     itemCount: displayedRooms.length,
  //   );
  // }

}
