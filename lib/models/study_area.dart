import 'package:flutter/material.dart';

class StudyArea {
  final String name;
  final String location;
  final String address;
  final String nearbyBusStops;
  final int capacity;
  final String openingHours;
  bool isFavourite;
  final String image;
  final List<String> gallery;

  StudyArea({
    @required this.name,
    @required this.location,
    @required this.address,
    @required this.nearbyBusStops,
    @required this.capacity,
    @required this.openingHours,
    this.isFavourite = false,
    this.image,
    this.gallery,
  });
}
