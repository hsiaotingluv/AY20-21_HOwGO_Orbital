import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'models/campus.dart';
import 'models/building.dart';
import 'models/room.dart';

const CAMPUS_CATEGORIES = const [
  Campus(title: 'Bukit Timah Campus'),
  Campus(title: 'Kent Ridge Campus'),
  Campus(title: 'Outram Campus'),
];

const BUILDING_CATEGORIES = const [
  Building(
    title: 'COM 1',
    campus: 'Kent Ridge Campus',
  ),
  Building(
    title: 'COM 2',
    campus: 'Kent Ridge Campus',
  ),
];

const String socAddress =
    'NUS School of Computing, COM1, 13, Computing Dr, 117417';

const ROOMS = const [
  // COM 1
  Room(
    title: 'Embedded Systems Teaching Lab 2',
    location: 'COM1-01-13',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 24,
  ),
  Room(
    title: 'Embedded Systems Teaching Lab 1',
    location: 'COM1-01-14',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 24,
  ),
  Room(
    title: 'Programming Lab 6',
    location: 'COM1-01-20',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 31,
  ),
  Room(
    title: 'Seminar Room 5',
    location: 'COM1-02-01',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 24,
  ),
  Room(
    title: 'Seminar Room 6',
    location: 'COM1-02-03',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 25,
  ),
  Room(
    title: 'Seminar Room 2',
    location: 'COM1-02-04',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 80,
  ),
  Room(
    title: 'Cerebro@SoC',
    location: 'COM1-02-05',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 70,
  ),
  Room(
    title: 'Seminar Room 1',
    location: 'COM1-02-06',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 200,
  ),
  Room(
    title: 'Seminar Room 7',
    location: 'COM1-02-07',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 30,
  ),
  Room(
    title: 'Seminar Room 8',
    location: 'COM1-02-08',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 36,
  ),
  Room(
    title: 'Seminar Room 9',
    location: 'COM1-02-09',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 30,
  ),
  Room(
    title: 'Seminar Room 10',
    location: 'COM1-02-10',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 42,
  ),
  Room(
    title: 'Seminar Room 3',
    location: 'COM1-02-12',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 80,
  ),
  Room(
    title: 'Video Conference Room',
    location: 'COM1-02-13',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 60,
  ),
  Room(
    title: 'Tutorial Room 11',
    location: 'COM1-02-16',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 20,
  ),
  Room(
    title: 'Tutorial Room 10',
    location: 'COM1-02-17',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 20,
  ),
  Room(
    title: 'Tutorial Room 5',
    location: 'COM1-02-18',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 25,
  ),
  Room(
    title: 'Datacomm & Parallel Computing Lab',
    location: 'COM1-B-02',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 48,
  ),
  Room(
    title: 'Active Learning Lab',
    location: 'COM1-B-03',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 40,
  ),
  Room(
    title: 'Programming Lab 3',
    location: 'COM1-B-08',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 25,
  ),
  Room(
    title: 'Programming Lab 2',
    location: 'COM1-B-09',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 46,
  ),
  Room(
    title: 'Programming Lab 5',
    location: 'COM1-B-10',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 23,
  ),
  Room(
    title: 'Programming Lab 4',
    location: 'COM1-B-11',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 25,
  ),
  Room(
    title: 'Programming Lab 1',
    location: 'COM1-B-12',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 48,
  ),
  Room(
    title: 'IT Security & OS Lab',
    location: 'COM1-B-13',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 40,
  ),

  // COM 2
  Room(
    title: 'Tutorial Room 9',
    location: 'COM2-01-08',
    building: 'COM 2',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 32,
  ),
  Room(
    title: 'LT16',
    location: 'COM2',
    building: 'COM 2',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 0,
  ),
  Room(
    title: 'LT17',
    location: 'COM2',
    building: 'COM 2',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 0,
  ),
];
