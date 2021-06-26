import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/lesson_provider.dart';
import '../widgets/edit_profile_item.dart';
import '../widgets/new_lesson.dart';
import '../widgets/lesson_item.dart';

class TimetableScreen extends StatefulWidget {
  static const routeName = '/timetable';

  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  void startAddNewClass(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewLesson();
      },
    );
  }

  void startEditProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return EditProfileItem();
      },
    );
  }

  Widget buildDayCategories(
    int i,
    BuildContext ctx,
    Lessons l,
  ) {
    String day;
    if (i == 0) {
      day = 'MONDAY';
    } else if (i == 1) {
      day = 'TUESDAY';
    } else if (i == 2) {
      day = 'WEDNESDAY';
    } else if (i == 3) {
      day = 'THURSDAY';
    } else if (i == 4) {
      day = 'FRIDAY';
    } else {
      day = 'MONDAY';
    }
    final filteredLessons = l.lessonsThisDay(day);
    filteredLessons.sort((a, b) {
      return int.parse(a.startTime).compareTo(int.parse(b.startTime));
    });
    return Column(
      children: [
        Container(
          height: 600,
          width: 310,
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return Container(
                alignment: Alignment.topCenter,
                child: Card(
                  elevation: 10,
                  child: LessonItem(
                    moduleCode: filteredLessons[i].moduleCode,
                    moduleName: filteredLessons[i].moduleName,
                    location: filteredLessons[i].location,
                    startTime: filteredLessons[i].startTime,
                    endTime: filteredLessons[i].endTime,
                    day: day,
                    last: filteredLessons.length == i + 1,
                    id: filteredLessons[i].id,
                  ),
                ),
              );
            },
            itemCount: filteredLessons.length,
            // physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final lessonList = Provider.of<Lessons>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => startEditProfile(context),
          ),
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () => startAddNewClass(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Container(
                  width: 62,
                  height: 661.88,
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.all(0),
                    child: NavigationRail(
                      minWidth: 10,
                      groupAlignment: 0.0,
                      backgroundColor: Colors
                          .blue.shade100, // Theme.of(context).cardTheme.color,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      labelType: NavigationRailLabelType.selected,
                      destinations: [
                        buildSideTabItem('M'),
                        buildSideTabItem('T'),
                        buildSideTabItem('W'),
                        buildSideTabItem('T'),
                        buildSideTabItem('F'),
                        // buildSideTabItem('F'),
                        NavigationRailDestination(
                          icon: Container(
                            width: 50,
                            child: Row(
                              children: [
                                Card(
                                  margin: EdgeInsets.all(0),
                                  // color: Theme.of(context).cardTheme.color,
                                  // color: Colors.blueGrey,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 40,
                                    height: 40,
                                    child: Icon(Icons.person),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          label: Text(''),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(thickness: 1, width: 1),
                // This is the main content.
                SingleChildScrollView(
                  child: buildDayCategories(
                    _selectedIndex,
                    context,
                    lessonList,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  NavigationRailDestination buildSideTabItem(String d) {
    return NavigationRailDestination(
      icon: Container(
        width: 50,
        child: Row(
          children: [
            Card(
              margin: EdgeInsets.all(0),
              // color: Theme.of(context).cardTheme.color,
              color: Colors.blueGrey,
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: Text(
                  d,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText2.color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      selectedIcon: Container(
        width: 50,
        child: Row(
          children: [
            Card(
              margin: EdgeInsets.all(0),
              color: Colors.orange,
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: Text(
                  d,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText2.color,
                  ),
                ),
              ),
            ),
            // Icon(
            //   Icons.arrow_right,
            //   size: 20,
            // ),
          ],
        ),
      ),
      label: Text(''),
    );
  }
}
