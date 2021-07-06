import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/room.dart';
import '../category_data.dart';
import '../helpers/sql_rooms.dart';

class Rooms with ChangeNotifier {
  List<Room> _rooms = ROOMS;
  List<Room> _favRooms = [];

  List<Room> get rooms {
    return [..._rooms];
  }

  List<Room> get favRooms {
    return [..._favRooms];
  }

  Room findByName(String name) {
    return _rooms.firstWhere((room) => room.name == name);
  }

  Future<void> toggleFavourite(String name) async {
    Room room = findByName(name);
    // room is not favourited -> favourite the room
    if (!room.isFavourite) {
      room.isFavourite = !room.isFavourite;
      await SQLRooms.makeFav(
        'favs_places',
        {
          'title': name,
          // 'isFavourite': true,
        },
      );
      notifyListeners();
    }
    // room is already favourited -> unfavourite the room
    else {
      room.isFavourite = !room.isFavourite;
      await SQLRooms.removeFav('favs_places', name);
      notifyListeners();
    }
  }

  Future<void> fetchAndSetFavs() async {
    final dataList = await SQLRooms.getData('favs_places');
    _favRooms = dataList
        .map(
          (i) => Room(
            name: i['title'],
            location: findByName(i['title']).location,
            building: findByName(i['title']).building,
            address: findByName(i['title']).address,
            nearbyBusStops: findByName(i['title']).nearbyBusStops,
            capacity: findByName(i['title']).capacity,
          ),
        )
        .toList();
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

//////////

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../models/room.dart';
// import '../category_data.dart';

// class Rooms with ChangeNotifier {
//   List<Room> _rooms = ROOMS;

//   List<Room> get rooms {
//     return [..._rooms];
//   }

//   List<Room> get favouriteRooms {
//     return _rooms.where((rooms) => rooms.isFavourite).toList();
//   }

//   Room findByName(String name) {
//     return _rooms.firstWhere((room) => room.name == name);
//   }

//   void toggleFavourite(String name) {
//     Room room = findByName(name);
//     room.isFavourite = !room.isFavourite;
//     notifyListeners();
//   }

//   Future<void> addRoom(Room room) async {
//     const url = 'https://orbital-howgo-default-rtdb.firebaseio.com/rooms.json';
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         body: json.encode({
//           'name': room.name,
//           'address': room.address,
//           'building': room.building,
//           'capacity': room.capacity,
//           'location': room.location,
//           'nearbyBusStops': room.nearbyBusStops,
//           'caption': room.caption,
//           'direction': room.direction,
//           'image': room.image,
//           'isFavourite': room.isFavourite,
//         }),
//       );

//       final newRoom = Room(
//         name: room.name,
//         address: room.address,
//         building: room.building,
//         capacity: room.capacity,
//         location: room.location,
//         nearbyBusStops: room.nearbyBusStops,
//         caption: room.caption,
//         direction: room.direction,
//         image: room.image,
//       );
//       _rooms.add(newRoom);
//       notifyListeners();
//     } catch (error) {
//       print(error);
//       throw error;
//     }
//   }
// }
