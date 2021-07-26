import 'package:flutter/material.dart';

import '../helpers/sql_rooms.dart';

class StudyAreas with ChangeNotifier {
  List<String> _favStudyAreas = [];

  List<String> get favRooms {
    return [..._favStudyAreas];
  }

  bool isStudyAreaFav(String studyAreaName) {
    return _favStudyAreas.any((element) => element == studyAreaName);
  }

  Future<int> toggleFavourite(String studyAreaName) async {
    bool isStudyAreaInFavList = isStudyAreaFav(studyAreaName);
    if (isStudyAreaInFavList) {
      int i = await SQLRooms.removeFav(
        studyAreaName,
      );
      _favStudyAreas.removeWhere((element) => element == studyAreaName);
      notifyListeners();
      return i;
    }
    // room not fav yet -> make fav
    else {
      int i = await SQLRooms.makeFav(
        {'title': studyAreaName},
      );
      _favStudyAreas.add(studyAreaName);
      notifyListeners();
      return i;
    }
  }

  Future<void> fetchAndSetFavs() async {
    final dataList = await SQLRooms.getData();
    _favStudyAreas = dataList.map((e) => e['title'] as String).toList();
    print('lenght of _favRooms is ${favRooms.length}');
    notifyListeners();
  }
}
