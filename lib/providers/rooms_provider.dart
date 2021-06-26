import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<void> addRoom(Room room) async {
    const url = 'https://orbital-howgo-default-rtdb.firebaseio.com/rooms.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'name': room.name,
          'address': room.address,
          'building': room.building,
          'capacity': room.capacity,
          'location': room.location,
          'nearbyBusStops': room.nearbyBusStops,
          'caption': room.caption,
          'direction': room.direction,
          'image': room.image,
          'isFavourite': room.isFavourite,
        }),
      );

      final newRoom = Room(
        name: room.name,
        address: room.address,
        building: room.building,
        capacity: room.capacity,
        location: room.location,
        nearbyBusStops: room.nearbyBusStops,
        caption: room.caption,
        direction: room.direction,
        image: room.image,
      );
      _rooms.add(newRoom);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
