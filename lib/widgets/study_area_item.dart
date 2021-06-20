import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../providers/study_areas_provider.dart';

class StudyAreaItem extends StatelessWidget {
  final String title;
  final String location;

  StudyAreaItem({
    this.title,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    final studyAreaList = Provider.of<StudyAreas>(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          iconWidget: Icon(
            Icons.favorite,
            size: 30,
          ),
          caption: 'Favourite',
          color: Colors.blueAccent.shade200,
          // icon: Icons.favorite,
          closeOnTap: true,
          foregroundColor: Colors.white,
          onTap: () {
            studyAreaList.toggleFavourite(title);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Study Spot added to favourites'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    studyAreaList.toggleFavourite(title);
                  },
                ),
              ),
            );
          },
        ),
      ],
      direction: Axis.horizontal,
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                padding: const EdgeInsets.all(0),
                child: ListTile(
                  title: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                  subtitle: Text(
                    location,
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
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
