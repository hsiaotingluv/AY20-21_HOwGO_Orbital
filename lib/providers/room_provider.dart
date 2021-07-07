import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../models/room.dart';
// import '../category_data.dart';

class Room with ChangeNotifier {
  final String key = 'fav';
  SharedPreferences _pref;
  bool isFavourite;

  bool get checkIfFav => isFavourite;

  final String name;
  final String location;
  final String building;
  final double address;
  final String nearbyBusStops;
  final int capacity;

  Room({
    @required this.name,
    @required this.location,
    @required this.building,
    @required this.address,
    @required this.nearbyBusStops,
    @required this.capacity,
    this.isFavourite = false,
  }) {
    _loadFromPrefs();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    isFavourite = _pref.getBool(key) ?? true;
    notifyListeners();
  }

  toggleFav() {
    isFavourite = !isFavourite;
    _saveToPrefs();
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, isFavourite);
  }

  // void toggleFavourite(String name) {
  //   isFavourite = !isFavourite;
  //   notifyListeners();
  // }
}
