import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/lesson_provider.dart';

class NewLesson extends StatefulWidget {
  @override
  _NewLessonState createState() => _NewLessonState();
}

class _NewLessonState extends State<NewLesson> {
  final moduleCodeController = TextEditingController();
  final moduleNameController = TextEditingController();
  final locationController = TextEditingController();
  final dayController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  String chosenDay;

  List<String> daysOptions = [
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY',
    'SUNDAY'
  ];

  @override
  Widget build(BuildContext context) {
    final lessonList = Provider.of<Lessons>(context);
    return Card(
      elevation: 5,
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 350,
              height: 50,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 200,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Module Code'),
                      controller: moduleCodeController,
                    ),
                  ),
                  Container(
                    width: 50,
                  ),
                  Container(
                    width: 100,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Start (XXXX)'),
                      controller: startController,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              height: 50,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 200,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Lesson Type'),
                      controller: moduleNameController,
                    ),
                  ),
                  Container(
                    width: 50,
                  ),
                  Container(
                    width: 100,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'End (XXXX)'),
                      controller: endController,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 200,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Location'),
                      controller: locationController,
                    ),
                  ),
                  Container(
                    width: 40,
                  ),
                  Container(
                    width: 130,
                    height: 35,
                    child: TextField(
                      controller: dayController,
                      decoration: InputDecoration(
                        suffixIcon: DropdownButton(
                          autofocus: true,
                          iconSize: 30,
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (value) {
                            dayController.text = value;
                          },
                          hint: Text('Select Day'),
                          items: daysOptions
                              .map(
                                (day) => DropdownMenuItem(
                                  child: Text(day),
                                  value: day,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add'),
              autofocus: true,
              onPressed: () {
                setState(
                  () {
                    lessonList.addLesson(
                      moduleCode:
                          moduleCodeController.text.toUpperCase().trim(),
                      moduleName: moduleNameController.text.trim(),
                      location: locationController.text.toUpperCase().trim(),
                      day: dayController.text,
                      startTime: startController.text.trim(),
                      endTime: endController.text.trim(),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
