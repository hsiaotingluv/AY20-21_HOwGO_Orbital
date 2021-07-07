import 'package:flutter/material.dart';

import '../helpers/sql_study_areas.dart';
import '../models/study_area.dart';
import '../category_data.dart';

class StudyAreas with ChangeNotifier {
  List<StudyArea> _studySpots = STUDYAREAS;
  List<StudyArea> _favStudyAreas = [];

  List<StudyArea> get areas {
    return [..._studySpots];
  }

  List<StudyArea> get favStudyAreas {
    return [..._favStudyAreas];
  }

  StudyArea findByName(String name) {
    return _studySpots.firstWhere((area) => area.name == name);
  }

  bool findFavByName(String name) {
    // return _favRooms.firstWhere((room) => room.name == name);
    return _favStudyAreas.any((room) => room.name == name);
  }

  Future<void> toggleFavourite(String name) async {
    bool isStudyAreaInFavList = findFavByName(name);
    StudyArea studyArea = findByName(name);
    // room is not favourited -> favourite the room
    if (!isStudyAreaInFavList) {
      studyArea.isFavourite = !studyArea.isFavourite;
      await SQLStudyAreas.makeFav(
        'favs_study_areas',
        {
          'title': name,
        },
      );
      notifyListeners();
    }
    // room is already favourited -> unfavourite the room
    else {
      studyArea.isFavourite = !studyArea.isFavourite;
      await SQLStudyAreas.removeFav('favs_study_areas', name);
      notifyListeners();
    }
  }

  Future<void> fetchAndSetFavs() async {
    final dataList = await SQLStudyAreas.getData('favs_study_areas');
    _favStudyAreas = dataList
        .map(
          (i) => StudyArea(
            name: i['title'],
            location: findByName(i['title']).location,
            address: findByName(i['title']).address,
            nearbyBusStops: findByName(i['title']).nearbyBusStops,
            capacity: findByName(i['title']).capacity,
            openingHours: findByName(i['title']).openingHours,
          ),
        )
        .toList();
    notifyListeners();
  }
}
