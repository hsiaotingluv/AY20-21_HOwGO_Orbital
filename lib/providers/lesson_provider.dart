import 'package:flutter/material.dart';

import '../category_data.dart';
import '../models/lesson.dart';

class Lessons with ChangeNotifier {
  List<Lesson> _lessons = LESSONS;

  List<Lesson> get lessons {
    return [..._lessons];
  }

  void addLesson({
    String moduleCode,
    String moduleName,
    String location,
    String day,
    String startTime,
    String endTime,
  }) {
    Lesson newLesson = Lesson(
      moduleCode: moduleCode,
      moduleName: moduleName,
      location: location,
      day: day,
      startTime: startTime,
      endTime: endTime,
    );
    _lessons.add(newLesson);
    notifyListeners();
  }

  List<Lesson> lessonsThisDay(String day) {
    return _lessons.where((lesson) => lesson.day == day).toList();
  }

  void removeLesson(String id) {
    _lessons.removeWhere((lesson) => lesson.id == id);
    notifyListeners();
  }
}
