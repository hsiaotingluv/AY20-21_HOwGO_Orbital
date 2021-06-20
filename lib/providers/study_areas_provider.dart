import 'package:flutter/material.dart';

import '../models/study_area.dart';
import '../category_data.dart';

class StudyAreas with ChangeNotifier {
  List<StudyArea> _studySpots = STUDYAREAS;

  List<StudyArea> get areas {
    return [..._studySpots];
  }

  List<StudyArea> get favouriteStudyAreas {
    return _studySpots.where((rooms) => rooms.isFavourite).toList();
  }

  StudyArea findByName(String name) {
    return _studySpots.firstWhere((area) => area.name == name);
  }

  void toggleFavourite(String name) {
    StudyArea area = findByName(name);
    area.isFavourite = !area.isFavourite;
    notifyListeners();
  }
}
