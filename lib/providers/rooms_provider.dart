import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/room.dart';
import '../category_data.dart';
import '../helpers/sql_rooms.dart';

class Rooms with ChangeNotifier {
  List<RoomModel> _rooms = ROOMS;
  List<RoomModel> _favRooms = [];

  List<RoomModel> get rooms {
    return [..._rooms];
  }

  List<RoomModel> get favRooms {
    return [..._favRooms];
  }

  RoomModel findByName(String name) {
    return _rooms.firstWhere((room) => room.name == name);
  }

  bool findFavByName(String name) {
    return _favRooms.any((room) => room.name == name);
  }

  Future<int> toggleFavourite(String name) async {
    bool isRoomInFavList = findFavByName(name);
    RoomModel room = findByName(name);
    // room is not favourited -> favourite the room
    if (!isRoomInFavList) {
      room.isFavourite = !room.isFavourite;
      int i = await SQLRooms.makeFav('favs_places', {'title': name});
      notifyListeners();
      return i;
    }
    // room is already favourited -> unfavourite the room
    else {
      room.isFavourite = !room.isFavourite;
      int i = await SQLRooms.removeFav('favs_places', name);
      notifyListeners();
      return i;
    }
  }

  Future<void> fetchAndSetFavs() async {
    final dataList = await SQLRooms.getData('favs_places');
    _favRooms = dataList
        .map(
          (i) => RoomModel(
            name: i['title'],
            location: findByName(i['title']).location,
            building: findByName(i['title']).building,
            address: findByName(i['title']).address,
            nearbyBusStops: findByName(i['title']).nearbyBusStops,
            capacity: findByName(i['title']).capacity,
            isFavourite: true,
          ),
        )
        .toList();
    notifyListeners();
  }

  Future<void> addRoom(RoomModel room) async {
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

      final newRoom = RoomModel(
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
