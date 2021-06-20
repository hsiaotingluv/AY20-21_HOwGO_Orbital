import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/lesson_provider.dart';

class LessonItem extends StatelessWidget {
  final String moduleCode;
  final String moduleName;
  final String location;
  final String id;
  final String day;
  final String startTime;
  final String endTime;
  bool last;

  LessonItem({
    this.location,
    this.moduleCode,
    this.moduleName,
    this.id,
    this.day,
    this.last,
    this.startTime,
    this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    final lessonList = Provider.of<Lessons>(context);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          right: 15,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (dir) {
        lessonList.removeLesson(id);
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lesson Deleted'),
            duration: Duration(seconds: 2),
            action: SnackBarAction(
              label: 'UNDO',
              onPressed: () {
                lessonList.addLesson(
                  moduleName: moduleName,
                  moduleCode: moduleCode,
                  startTime: startTime,
                  endTime: endTime,
                  location: location,
                  day: day,
                );
              },
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 120,
              child: Card(
                elevation: 0,
                // color: Colors.blueGrey.shade100,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        child: Card(
                          color: Colors.blue.shade400,
                          child: Center(
                            child: Text(
                              startTime,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 60,
                        child: Card(
                          // margin: EdgeInsets.only(),
                          color: Colors.lightBlue.shade300,
                          child: Center(
                            child: Text(
                              '12:00',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 7),
                  height: 120,
                  width: 170,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 35,
                          child: Text(
                            moduleCode,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 30,
                          child: Text(
                            moduleName,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                          width: double.infinity,
                        ),
                        Container(
                          // padding: EdgeInsets.only(top: 5),
                          height: 20,
                          child: Text(
                            location,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
