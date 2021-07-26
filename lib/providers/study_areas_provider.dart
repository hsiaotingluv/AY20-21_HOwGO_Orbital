import 'package:flutter/material.dart';
import 'package:howgo/helpers/sql_study_areas.dart';

import '../helpers/sql_rooms.dart';

class StudyAreas with ChangeNotifier {
  List<String> _favStudyAreas = [];

  List<String> get favRooms {
    return [..._favStudyAreas];
  }

  List<String> get noDuplicates {
    return _favStudyAreas.toSet().toList();
  }

  bool isStudyAreaFav(String studyAreaName) {
    return _favStudyAreas.any((element) => element == studyAreaName);
  }

  Future<int> toggleFavourite(String studyAreaName) async {
    bool isStudyAreaInFavList = isStudyAreaFav(studyAreaName);
    if (isStudyAreaInFavList) {
      int i = await SQLStudyAreas.removeFav(
        studyAreaName,
      );
      _favStudyAreas.removeWhere((element) => element == studyAreaName);
      notifyListeners();
      return i;
    }
    // room not fav yet -> make fav
    else {
      int i = await SQLStudyAreas.makeFav(
        {'title': studyAreaName},
      );
      _favStudyAreas.add(studyAreaName);
      notifyListeners();
      return i;
    }
  }

  Future<void> fetchAndSetFavs() async {
    final dataList = await SQLStudyAreas.getData();
    _favStudyAreas = dataList.map((e) => e['title'] as String).toList();
    print('lenght of _favRooms is ${favRooms.length}');
    notifyListeners();
  }
}
