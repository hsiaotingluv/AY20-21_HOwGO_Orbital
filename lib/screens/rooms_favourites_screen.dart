import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/rooms_provider.dart';
import '../models/room.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/room_item.dart';

class RoomsFavouritesScreen extends StatelessWidget {
  var favouriteRooms = [];
  List<RoomModel> _favRooms = [];

  @override
  Widget build(BuildContext context) {
    final roomList = Provider.of<Rooms>(context);
    final bgrColor = Theme.of(context).backgroundColor;
    // if (roomList.favouriteRooms.isEmpty) {
    return Scaffold(
      backgroundColor: bgrColor,
      body: FutureBuilder(
        future: Provider.of<Rooms>(context, listen: true).fetchAndSetFavs(),
        builder: (ctx, snapshot) => Consumer<Rooms>(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'You have no favourites yet. \n Start adding some!',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      ),
                  height: 250,
                  width: 350,
                  child: Image.asset(
                    'assets/images/makeFavRoomEg.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          builder: (ctx, favs, ch) => favs.favRooms.length <= 0
              ? ch
              : ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: favs.favRooms.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      child: RoomItem(
                        title: favs.favRooms[index].name,
                        location: favs.favRooms[index].location,
                        building: favs.favRooms[index].building,
                        gridView: false,
                      ),
                    );
                  },
                ),
        ),
      ),
      // bottomNavigationBar: NavigationBar(2),
    );
    // } else {
    //   return showListView(roomList.favouriteRooms, bgrColor);
    // }
  }
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/rooms_provider.dart';
// import '../models/room.dart';
// import '../widgets/room_item.dart';

// class RoomsFavouritesScreen extends StatelessWidget {
//   var favouriteRooms = [];
//   Scaffold showListView(List<Room> favouriteRooms, Color bgrColor) {
//     return Scaffold(
//       backgroundColor: bgrColor,
//       body: ListView.builder(
//         padding: const EdgeInsets.all(5),
//         itemBuilder: (ctx, index) {
//           return Container(
//             padding: const EdgeInsets.all(5),
//             child: RoomItem(
//               title: favouriteRooms[index].name,
//               location: favouriteRooms[index].location,
//               building: favouriteRooms[index].building,
//               gridView: false,
//             ),
//           );
//         },
//         itemCount: favouriteRooms.length,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final roomList = Provider.of<Rooms>(context);
//     final bgrColor = Theme.of(context).backgroundColor;
//     if (roomList.favouriteRooms.isEmpty) {
//       return Scaffold(
//         backgroundColor: bgrColor,
//         body: Center(
//           child: Text(
//             'You have no favourites yet - start adding some!',
//             style: TextStyle(fontSize: 20),
//             softWrap: true,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       );
//     } else {
//       return showListView(roomList.favouriteRooms, bgrColor);
//     }
//   }
// }
