import 'package:flutter/material.dart';

import 'building.dart';

class Room {
  final String title;
  final String location;
  final String building;
  final String address;
  final String nearbyBusStops;
  final int capacity;
  final int numOfAttributes = 6;

  const Room({
    @required this.title,
    @required this.location,
    @required this.building,
    @required this.address,
    @required this.nearbyBusStops,
    @required this.capacity,
  });
}
