import 'package:flutter/material.dart';

import '../models/room.dart';
import '../category_data.dart';

class Rooms with ChangeNotifier {
  List<Room> _rooms = ROOMS;

  List<Room> get rooms {
    return [..._rooms];
  }

  List<Room> get favouriteRooms {
    return _rooms.where((rooms) => rooms.isFavourite).toList();
  }

  Room findByName(String name) {
    return _rooms.firstWhere((room) => room.name == name);
  }

  void toggleFavourite(String name) {
    Room room = findByName(name);
    room.isFavourite = !room.isFavourite;
    notifyListeners();
  }
}
