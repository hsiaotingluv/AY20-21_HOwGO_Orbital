import './models/lesson.dart';
import './models/profile.dart';
import './models/study_area.dart';
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
    title: 'COM1',
    faculty: 'School of Computing',
    campus: 'Kent Ridge Campus',
  ),
  Building(
    title: 'COM2',
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
  RoomModel(
    name: 'Embedded Systems Teaching Lab 1',
    location: 'COM1-01-14',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0114.jpg',
    capacity: 24,
  ),
  RoomModel(
    name: 'Embedded Systems Teaching Lab 2',
    location: 'COM1-01-13',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0113.jpg',
    capacity: 24,
  ),

  RoomModel(
    name: 'Seminar Room 1',
    location: 'COM1-02-06',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0206.jpg',
    capacity: 200,
  ),
  RoomModel(
    name: 'Seminar Room 2',
    location: 'COM1-02-04',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0204.jpg',
    capacity: 80,
  ),
  RoomModel(
    name: 'Seminar Room 3',
    location: 'COM1-02-12',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0212.jpg',
    capacity: 80,
  ),
  RoomModel(
    name: 'Seminar Room 5',
    location: 'COM1-02-01',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0201.jpg',
    capacity: 24,
  ),
  RoomModel(
    name: 'Seminar Room 6',
    location: 'COM1-02-03',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0203.jpg',
    capacity: 25,
  ),

  RoomModel(
    name: 'Seminar Room 7',
    location: 'COM1-02-07',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0207.jpg',
    capacity: 30,
  ),
  RoomModel(
    name: 'Seminar Room 8',
    location: 'COM1-02-08',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0208.jpg',
    capacity: 36,
  ),
  RoomModel(
    name: 'Seminar Room 9',
    location: 'COM1-02-09',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0209.jpg',
    capacity: 30,
  ),
  RoomModel(
    name: 'Seminar Room 10',
    location: 'COM1-02-10',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0210.jpg',
    capacity: 42,
  ),
  RoomModel(
    name: 'Cerebro@SoC',
    location: 'COM1-02-05',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    capacity: 70,
  ),

  RoomModel(
    name: 'Video Conference Room',
    location: 'COM1-02-13',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/VCRM.jpg',
    capacity: 60,
  ),
  RoomModel(
    name: 'Tutorial Room 5',
    location: 'COM1-02-18',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    capacity: 25,
  ),
  RoomModel(
    name: 'Tutorial Room 9',
    location: 'COM2-01-08',
    building: 'COM2',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM2-0108.jpg',
    capacity: 32,
  ),
  RoomModel(
    name: 'Tutorial Room 10',
    location: 'COM1-02-17',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0217.jpg',
    direction: [
      'assets/images/directions/COM1-0217_route/COM1-0217(1).png',
      'assets/images/directions/COM1-0217_route/COM1-0217(2).png',
      'assets/images/directions/COM1-0217_route/COM1-0217(3).png',
      'assets/images/directions/COM1-0217_route/COM1-0217(4).png',
    ],
    caption: [
      'Hello World',
      'Hello World',
      'Hello World',
      'Hello World',
    ],
    gallery: [
      'assets/images/gallery/COM1-0217_gallery_1.jpg',
      'assets/images/gallery/COM1-0217_gallery_2.jpg',
      'assets/images/gallery/COM1-0217_gallery_3.jpg',
      'assets/images/gallery/COM1-0217_gallery_4.jpg',
    ],
    capacity: 20,
  ),
  RoomModel(
    name: 'Tutorial Room 11',
    location: 'COM1-02-16',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-0216.jpg',
    capacity: 20,
  ),

  RoomModel(
    name: 'Datacomm & Parallel Computing Lab',
    location: 'COM1-B-02',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-B102.jpg',
    capacity: 48,
  ),
  RoomModel(
    name: 'Active Learning Lab',
    location: 'COM1-B-03',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-B103.jpg',
    capacity: 40,
  ),

  RoomModel(
    name: 'Programming Lab 1',
    location: 'COM1-B-12',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-B112.jpg',
    capacity: 48,
  ),
  RoomModel(
    name: 'Programming Lab 2',
    location: 'COM1-B-09',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-B109.jpg',
    capacity: 46,
  ),
  RoomModel(
    name: 'Programming Lab 3',
    location: 'COM1-B-08',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-B108.jpg',
    capacity: 25,
  ),
  RoomModel(
    name: 'Programming Lab 4',
    location: 'COM1-B-11',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-B111.jpg',
    capacity: 25,
  ),
  RoomModel(
    name: 'Programming Lab 5',
    location: 'COM1-B-10',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-B110.jpg',
    capacity: 23,
  ),
  RoomModel(
    name: 'Programming Lab 6',
    location: 'COM1-01-20',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    capacity: 31,
  ),

  RoomModel(
    name: 'IT Security & OS Lab',
    location: 'COM1-B-13',
    building: 'COM1',
    address: socAddress,
    nearbyBusStops: 'COM2',
    image: 'assets/images/rooms/COM1-B113.jpg',
    capacity: 40,
  ),

  // COM 2

  RoomModel(
    name: 'LT16',
    location: 'COM2',
    building: 'COM2',
    address: socAddress,
    nearbyBusStops: 'COM2',
    capacity: 0,
  ),
  RoomModel(
    name: 'LT17',
    location: 'COM2',
    building: 'COM2',
    address: socAddress,
    nearbyBusStops: 'COM2',
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
