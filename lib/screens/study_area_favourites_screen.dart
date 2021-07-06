import 'package:flutter/material.dart';
import 'package:howgo/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

import '../models/study_area.dart';
import '../providers/study_areas_provider.dart';
import '../widgets/study_area_item.dart';

class StudyAreaFavouritesScreen extends StatelessWidget {
  var favouriteStudyArea = [];
  // Scaffold showListView(List<StudyArea> favouriteStudyArea, Color bgrColor) {
  //   return Scaffold(
  //     backgroundColor: bgrColor,
  //     body: ListView.builder(
  //       padding: const EdgeInsets.all(5),
  //       itemBuilder: (ctx, index) {
  //         return Container(
  //           padding: const EdgeInsets.all(5),
  //           child: StudyAreaItem(
  //             title: favouriteStudyArea[index].name,
  //             location: favouriteStudyArea[index].location,
  //           ),
  //         );
  //       },
  //       itemCount: favouriteStudyArea.length,
  //     ),
  //     bottomNavigationBar: NavigationBar(2),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final studyAreaList = Provider.of<StudyAreas>(context);
    final bgrColor = Theme.of(context).backgroundColor;
    // if (studyAreaList.favouriteStudyAreas.isEmpty) {
    return Scaffold(
      backgroundColor: bgrColor,
      body: FutureBuilder(
        future:
            Provider.of<StudyAreas>(context, listen: true).fetchAndSetFavs(),
        builder: (ctx, snapshot) => Consumer<StudyAreas>(
          child: Center(
            child: Text(
              'You have no favourites yet - start adding some!',
              style: TextStyle(fontSize: 20),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          builder: (ctx, favs, ch) => favs.favStudyAreas.length <= 0
              ? ch
              : ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: favs.favStudyAreas.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      child: StudyAreaItem(
                        title: favs.favStudyAreas[index].name,
                        location: favs.favStudyAreas[index].location,
                      ),
                    );
                  },
                ),
        ),
      ),
      bottomNavigationBar: NavigationBar(2),
    );
  }
}
