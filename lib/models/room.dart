import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomModel {
  final String name;
  final String location;
  final String building;
  final String faculty;
  final String address;
  final String nearbyBusStops;
  final String image;
  final int capacity;
  final List<String> direction;
  final List<String> caption;
  final List<String> gallery;
  bool isFavourite;

  RoomModel({
    @required this.name,
    @required this.location,
    @required this.building,
    @required this.address,
    @required this.nearbyBusStops,
    @required this.capacity,
    this.image,
    this.direction,
    this.caption,
    this.gallery,
    this.faculty = 'SoC',
    this.isFavourite = false,
  }) {
    // _loadFromPrefs();
  }

  // final String key = 'fav';
  // SharedPreferences _pref;

  // _initPrefs() async {
  //   if (_pref == null) _pref = await SharedPreferences.getInstance();
  // }

  // _loadFromPrefs() async {
  //   await _initPrefs();
  //   isFavourite = _pref.getBool(key) ?? true;
  //   notifyListeners();
  // }

  // toggleFav() {
  //   isFavourite = !isFavourite;
  //   _saveToPrefs();
  //   notifyListeners();
  // }

  // _saveToPrefs() async {
  //   await _initPrefs();
  //   _pref.setBool(key, isFavourite);
  // }

  // void toggleFavourite(String name) {
  //   isFavourite = !isFavourite;
  //   notifyListeners();
  // }
}
