import 'package:flutter/material.dart';

// import '../models/room.dart';
// import '../category_data.dart';

class Room with ChangeNotifier {
  final String name;
  final String location;
  final String building;
  final double address;
  final String nearbyBusStops;
  final int capacity;
  bool isFavourite;

  Room({
    @required this.name,
    @required this.location,
    @required this.building,
    @required this.address,
    @required this.nearbyBusStops,
    @required this.capacity,
    this.isFavourite = false,
  });

  void toggleFavourite(String name) {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
