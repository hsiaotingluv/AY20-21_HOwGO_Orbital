import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../models/profile.dart';
import '/models/study_area.dart';

import './models/faculty.dart';
import './models/campus.dart';
import './models/building.dart';
import './models/room.dart';

const CAMPUS_CATEGORIES = const [
  Campus(
    name: 'Bukit Timah Campus',
    image: 'assets/images/bukit-nus.png',
  ),
  Campus(
    name: 'Kent Ridge Campus',
    image: 'assets/images/utown_green.png',
  ),
  Campus(
    name: 'Outram Campus',
    image: 'assets/images/outram-nus.png',
  ),
];

const BUILDING_CATEGORIES = const [
  Building(
    title: 'COM 1',
    faculty: 'School of Computing',
    campus: 'Kent Ridge Campus',
  ),
  Building(
    title: 'COM 2',
    faculty: 'School of Computing',
    campus: 'Kent Ridge Campus',
  ),
];

const FACULTY_CATEGORIES = const [
  Faculty(
    name: 'School of Computing',
    campus: 'Kent Ridge Campus',
    image: 'assets/images/soc.png',
  ),
];

const String socAddress =
    'NUS School of Computing, COM1, 13, Computing Dr, 117417';

var ROOMS = [
  // COM 1
  Room(
    name: 'Embedded Systems Teaching Lab 1',
    location: 'COM1-01-14',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 24,
  ),
  Room(
    name: 'Embedded Systems Teaching Lab 2',
    location: 'COM1-01-13',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 24,
  ),

  Room(
    name: 'Seminar Room 1',
    location: 'COM1-02-06',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 200,
  ),
  Room(
    name: 'Seminar Room 2',
    location: 'COM1-02-04',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 80,
  ),
  Room(
    name: 'Seminar Room 3',
    location: 'COM1-02-12',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 80,
  ),
  Room(
    name: 'Seminar Room 5',
    location: 'COM1-02-01',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 24,
  ),
  Room(
    name: 'Seminar Room 6',
    location: 'COM1-02-03',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 25,
  ),

  Room(
    name: 'Seminar Room 7',
    location: 'COM1-02-07',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 30,
  ),
  Room(
    name: 'Seminar Room 8',
    location: 'COM1-02-08',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 36,
  ),
  Room(
    name: 'Seminar Room 9',
    location: 'COM1-02-09',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 30,
  ),
  Room(
    name: 'Seminar Room 10',
    location: 'COM1-02-10',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 42,
  ),
  Room(
    name: 'Cerebro@SoC',
    location: 'COM1-02-05',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 70,
  ),

  Room(
    name: 'Video Conference Room',
    location: 'COM1-02-13',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 60,
  ),
  Room(
    name: 'Tutorial Room 5',
    location: 'COM1-02-18',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 25,
  ),

  Room(
    name: 'Tutorial Room 9',
    location: 'COM2-01-08',
    building: 'COM 2',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 32,
  ),
  Room(
    name: 'Tutorial Room 10',
    location: 'COM1-02-17',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 20,
  ),
  Room(
    name: 'Tutorial Room 11',
    location: 'COM1-02-16',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 20,
  ),

  Room(
    name: 'Datacomm & Parallel Computing Lab',
    location: 'COM1-B-02',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 48,
  ),
  Room(
    name: 'Active Learning Lab',
    location: 'COM1-B-03',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 40,
  ),

  Room(
    name: 'Programming Lab 1',
    location: 'COM1-B-12',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 48,
  ),
  Room(
    name: 'Programming Lab 2',
    location: 'COM1-B-09',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 46,
  ),
  Room(
    name: 'Programming Lab 3',
    location: 'COM1-B-08',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 25,
  ),
  Room(
    name: 'Programming Lab 4',
    location: 'COM1-B-11',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 25,
  ),
  Room(
    name: 'Programming Lab 5',
    location: 'COM1-B-10',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 23,
  ),
  Room(
    name: 'Programming Lab 6',
    location: 'COM1-01-20',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 31,
  ),

  Room(
    name: 'IT Security & OS Lab',
    location: 'COM1-B-13',
    building: 'COM 1',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 40,
  ),

  // COM 2

  Room(
    name: 'LT16',
    location: 'COM2',
    building: 'COM 2',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 0,
  ),
  Room(
    name: 'LT17',
    location: 'COM2',
    building: 'COM 2',
    address: socAddress,
    nearbyBusStops: 'COM 2',
    capacity: 0,
  ),
];

var STUDYAREAS = [
  StudyArea(
      name: 'Central Library',
      location: 'Beside AS8',
      address: '12 Kent Ridge Crescent Singapore 119275',
      nearbyBusStops: 'Central Library',
      capacity: 500,
      openingHours: '0900 - 0600'),
  StudyArea(
    name: 'Outside UTown Starbucks',
    location: 'University Town',
    address:
        '#B1, 8 College Ave West, 01 University Town, Education Resource Centre, 138608',
    nearbyBusStops: 'University Town',
    capacity: 100,
    openingHours: '24 Hours',
  ),
];
var LESSONS = [
  Lesson(
    moduleCode: 'CS2030S',
    moduleName: 'Lecture',
    day: 'MONDAY',
    startTime: '1400',
    endTime: '1600',
    location: 'Zoom',
  ),
  Lesson(
    moduleCode: 'CS2040S',
    moduleName: 'Recitation',
    day: 'TUESDAY',
    startTime: '0900',
    endTime: '1000',
    location: 'Zoom',
  ),
  Lesson(
    moduleCode: 'ES1601',
    moduleName: 'Tutorial',
    day: 'TUESDAY',
    startTime: '1200',
    endTime: '1400',
    location: 'RVR-SRM2',
  ),
  Lesson(
    moduleCode: 'WR1401',
    moduleName: 'Tutorial',
    day: 'TUESDAY',
    startTime: '1400',
    endTime: '1600',
    location: 'RVR-MPR01',
  ),
  Lesson(
    moduleCode: 'CS2040S',
    moduleName: 'Lecture',
    day: 'TUESDAY',
    startTime: '1600',
    endTime: '1800',
    location: 'Zoom',
  ),
  Lesson(
    moduleCode: 'CS2030S',
    moduleName: 'Recitation',
    day: 'WEDNESDAY',
    startTime: '0900',
    endTime: '1000',
    location: 'RMI-SR1',
  ),
  Lesson(
    moduleCode: 'GES1017',
    moduleName: 'Lecture',
    day: 'WEDNESDAY',
    startTime: '1200',
    endTime: '1500',
    location: 'LT1',
  ),
  Lesson(
    moduleCode: 'CS2030S',
    moduleName: 'Lab',
    day: 'THURSDAY',
    startTime: '1000',
    endTime: '1200',
    location: 'Programming Lab 6',
  ),
  Lesson(
    moduleCode: 'CS2040S',
    moduleName: 'Tutorial',
    day: 'THURSDAY',
    startTime: '1300',
    endTime: '1500',
    location: 'Zoom',
  ),
  Lesson(
    moduleCode: 'CS2040S',
    moduleName: 'Lecture',
    day: 'THURSDAY',
    startTime: '1600',
    endTime: '1700',
    location: 'Zoom',
  ),
  Lesson(
    moduleCode: 'EC1301',
    moduleName: 'Tutorial',
    day: 'THURSDAY',
    startTime: '1700',
    endTime: '1800',
    location: 'Zoom',
  ),
];

var PROFILES = [
  Profile('RAVEEN PRABHU', 'COMPUTER SCIENCE'),
];
