import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../screens/study_area_detail_screen.dart';
import '../providers/study_areas_provider.dart';

class StudyAreaItem extends StatelessWidget {
  final String title;
  final String location;

  StudyAreaItem({
    this.title,
    this.location,
  });

  void selectStudyArea(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(StudyAreaDetailScreen.routeName, arguments: {
      'title': title,
      'location': location,
    }).then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final studyAreaList = Provider.of<StudyAreas>(context, listen: false);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        Consumer<StudyAreas>(
          builder: (ctx, studyAreaList, child) => IconSlideAction(
            icon: studyAreaList.findByName(title).isFavourite
                ? Icons.favorite
                : Icons.favorite_border,
            // iconWidget: Icon(
            //   Icons.favorite,
            //   size: 30,
            // ),
            caption: 'Favourite',
            color: Theme.of(context).primaryColor,
            // icon: Icons.favorite,
            closeOnTap: true,
            foregroundColor: Colors.white,
            onTap: () {
              studyAreaList.toggleFavourite(title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: studyAreaList.findByName(title).isFavourite
                      ? Text('Study Spot added to favourites')
                      : Text('Study Spot removed from favourites'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    textColor: Colors.cyan,
                    onPressed: () {
                      studyAreaList.toggleFavourite(title);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
      direction: Axis.horizontal,
      child: Column(
        children: [
          InkWell(
            onTap: () => selectStudyArea(context),
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                padding: const EdgeInsets.all(0),
                child: ListTile(
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: Text(
                    location,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  // trailing: IconButton(
                  //   icon: Icon(
                  //     studyAreaList.findByName(title).isFavourite
                  //         ? Icons.star
                  //         : Icons.star_border,
                  //     size: 30,
                  //   ),
                  //   color: Theme.of(context).iconTheme.color,
                  //   splashRadius: 1,
                  //   onPressed: () => studyAreaList.toggleFavourite(title),
                  // ),
                ),
                height: 75,
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
