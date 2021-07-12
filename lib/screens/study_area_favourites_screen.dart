import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/study_areas_provider.dart';
import '../widgets/study_area_item.dart';

class StudyAreaFavouritesScreen extends StatelessWidget {
  var favouriteStudyArea = [];

  @override
  Widget build(BuildContext context) {
    final studyAreaList = Provider.of<StudyAreas>(context);
    final bgrColor = Theme.of(context).backgroundColor;
    return Scaffold(
      backgroundColor: bgrColor,
      body: FutureBuilder(
        future:
            Provider.of<StudyAreas>(context, listen: true).fetchAndSetFavs(),
        builder: (ctx, snapshot) => Consumer<StudyAreas>(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'You have no favourites yet. \n Start adding some!',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      ),
                  height: 250,
                  width: 350,
                  child: Image.asset(
                    'assets/images/makeStudySpotFavEg.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          builder: (ctx, favs, ch) => favs.favStudyAreas.length <= 0
              ? ch
              : ListView.builder(
                  // padding: const EdgeInsets.all(5),
                  itemCount: favs.favStudyAreas.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      // padding: const EdgeInsets.all(5),
                      child: StudyAreaItem(
                        title: favs.favStudyAreas[index].name,
                        location: favs.favStudyAreas[index].location,
                      ),
                    );
                  },
                ),
        ),
      ),
      // bottomNavigationBar: NavigationBar(2),
    );
  }
}
