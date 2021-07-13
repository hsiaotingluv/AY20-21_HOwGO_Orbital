import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';

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
    final studyAreaList = Provider.of<StudyAreas>(context, listen: false);
    bool isFav = studyAreaList.findFavByName(title);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        Consumer<StudyAreas>(
          builder: (ctx, studyAreaList, child) => IconSlideAction(
            icon: isFav ? Icons.favorite : Icons.favorite_border,
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
              studyAreaList.fetchAndSetFavs();
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: !isFav
                      ? Text('Study Spot added to favourites')
                      : Text('Study Spot removed from favourites'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    textColor: Colors.cyan,
                    onPressed: () {
                      studyAreaList.toggleFavourite(title);
                      studyAreaList.fetchAndSetFavs();
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
          Container(
            height: 85,
            child: InkWell(
              onTap: () => selectStudyArea(context),
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(1),
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  title: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                  ),
                  subtitle: Text(
                    location,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      isFav
                          ? Platform.isIOS
                              ? CupertinoIcons.heart_fill
                              : Icons.favorite
                          : Platform.isIOS
                              ? CupertinoIcons.heart
                              : Icons.favorite_border,
                      size: 19.sp,
                    ),
                    color: Theme.of(context).iconTheme.color,
                    splashRadius: 1,
                    onPressed: () {
                      studyAreaList.toggleFavourite(title);
                      studyAreaList.fetchAndSetFavs();
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: !isFav
                              ? Text('Study Spot added to favourites')
                              : Text('Study Spot removed from favourites'),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'UNDO',
                            textColor: Colors.cyan,
                            onPressed: () {
                              studyAreaList.toggleFavourite(title);
                              studyAreaList.fetchAndSetFavs();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                height: 70,
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 0.5,
            color: Theme.of(context).dividerColor,
            indent: 15,
            endIndent: 15,
          ),
        ],
      ),
    );
  }
}
