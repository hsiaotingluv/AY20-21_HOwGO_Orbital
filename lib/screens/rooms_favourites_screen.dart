import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/rooms_provider.dart';
import '../widgets/room_item.dart';

class RoomsFavouritesScreen extends StatelessWidget {
  var favouriteRooms = [];

  @override
  Widget build(BuildContext context) {
    final bgrColor = Theme.of(context).backgroundColor;
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
                  itemCount: favs.favRooms.length,
                  itemBuilder: (ctx, index) {
                    return Container(
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
    );
  }
}
