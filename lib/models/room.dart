import 'package:flutter/material.dart';

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
  });
}
