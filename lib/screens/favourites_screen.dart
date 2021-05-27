import 'package:flutter/material.dart';

import '../widgets/room_item.dart';
import '../models/room.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Room> favouriteRooms;
  final Function toggleFavourite;
  final Function isFavourite;

  FavouritesScreen(this.favouriteRooms, this.toggleFavourite, this.isFavourite);

  ListView showListView(List<Room> favouriteRooms) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      itemBuilder: (ctx, index) {
        return Container(
          padding: const EdgeInsets.all(5),
          child: RoomItem(
            title: favouriteRooms[index].title,
            location: favouriteRooms[index].location,
            building: favouriteRooms[index].building,
            gridView: false,
            toggleFavourite: toggleFavourite,
            isFavourite: isFavourite,
          ),
        );
      },
      itemCount: favouriteRooms.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (favouriteRooms.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    } else {
      return showListView(favouriteRooms);
    }
  }
}
