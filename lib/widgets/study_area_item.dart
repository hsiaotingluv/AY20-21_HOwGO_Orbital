import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sizer/sizer.dart';

import '../providers/study_areas_provider.dart';
import '../screens/room_detail_screen.dart';

// ignore: must_be_immutable
class StudyAreaItem extends StatelessWidget {
  final DocumentSnapshot<Object> selectedRoom;

  StudyAreaItem({
    this.selectedRoom,
  });

  void selectRoom(BuildContext ctx) {
    Navigator.push(
      ctx,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => RoomDetailScreen(
          selectedRoom: selectedRoom,
        ),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  Widget buildIconTile(BuildContext context, IconData icon, String title) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            size: 15.sp,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 11.sp,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final studyAreaProvider = Provider.of<StudyAreas>(context);
    bool isFav = studyAreaProvider.isStudyAreaFav(selectedRoom['name']);
    return Column(
      children: [
        Container(
          height: 16.h,
          child: InkWell(
            onTap: () => selectRoom(context),
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(1),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                    selectedRoom['coverphoto'],
                    height: 13.h,
                    width: 25.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    width: 50.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          selectedRoom['name'],
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                        Text(
                          selectedRoom['location'],
                          style: TextStyle(
                            fontSize: 11.0.sp,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              buildIconTile(
                                context,
                                Icons.group_rounded,
                                'x${selectedRoom['capacity']}',
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              buildIconTile(
                                context,
                                Icons.directions_bus_rounded,
                                selectedRoom['nearbyBusStops'],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        studyAreaProvider.toggleFavourite(selectedRoom['name']);
                        studyAreaProvider.fetchAndSetFavs();
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: !isFav
                                ? Text('Room added to favourites')
                                : Text('Room removed from favourites'),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'UNDO',
                              textColor: Colors.cyan,
                              onPressed: () {
                                studyAreaProvider
                                    .toggleFavourite(selectedRoom['name']);
                                studyAreaProvider.fetchAndSetFavs();
                              },
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          height: 0,
          thickness: 0.5.sp,
          color: Theme.of(context).dividerColor,
          indent: 15,
          endIndent: 15,
        ),
      ],
    );
  }
}
