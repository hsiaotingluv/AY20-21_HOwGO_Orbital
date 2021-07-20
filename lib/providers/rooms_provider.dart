import 'package:flutter/material.dart';

import '../helpers/sql_rooms.dart';

class Rooms with ChangeNotifier {
  List<String> _favRooms = [];

  List<String> get favRooms {
    return [..._favRooms];
  }

  bool isRoomFav(String roomName) {
    return _favRooms.any((element) => element == roomName);
  }

  Future<int> toggleFavourite(String roomName) async {
    bool isRoomInFavList = isRoomFav(roomName);
    if (isRoomInFavList) {
      int i = await SQLRooms.removeFav(
        roomName,
      );
      _favRooms.removeWhere((element) => element == roomName);
      notifyListeners();
      return i;
    }
    // room not fav yet -> make fav
    else {
      int i = await SQLRooms.makeFav(
        {'title': roomName},
      );
      _favRooms.add(roomName);
      notifyListeners();
      return i;
    }
  }

  Future<void> fetchAndSetFavs() async {
    final dataList = await SQLRooms.getData();
    _favRooms = dataList.map((e) => e['title'] as String).toList();
    print('lenght of _favRooms is ${favRooms.length}');
    notifyListeners();
  }
}
