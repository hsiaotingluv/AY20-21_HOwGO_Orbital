import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/study_areas_provider.dart';
import '../widgets/main_drawer.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/study_area_item.dart';

class StudyAreasScreen extends StatefulWidget {
  static const routeName = '/study';

  @override
  _StudyAreasScreenState createState() => _StudyAreasScreenState();
}

class _StudyAreasScreenState extends State<StudyAreasScreen> {
  @override
  Widget build(BuildContext context) {
    final studyAreas = Provider.of<StudyAreas>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Spots'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: MainDrawer(),
      body: ListView.builder(
        // padding: const EdgeInsets.all(5),
        itemBuilder: (ctx, index) {
          return Container(
            // padding: const EdgeInsets.all(5),
            child: StudyAreaItem(
              title: studyAreas.areas[index].name,
              location: studyAreas.areas[index].location,
            ),
          );
        },
        itemCount: studyAreas.areas.length,
      ),
      bottomNavigationBar: NavigationBar(3),
    );
  }
}
