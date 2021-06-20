import 'package:flutter/material.dart';

class Lesson {
  final String moduleCode;
  final String moduleName;
  final String day;
  final String startTime;
  final String endTime;
  final String location;
  final String id = DateTime.now().toString();

  Lesson({
    this.moduleCode,
    this.moduleName,
    this.day,
    this.startTime,
    this.endTime,
    this.location,
  });
}
