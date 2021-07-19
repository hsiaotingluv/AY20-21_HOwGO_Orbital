import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/faculty_screen.dart';

class CampusItem extends StatelessWidget {
  final String campus;
  final String image;
  // List<Faculty> _availableFaculties = FACULTY_CATEGORIES;

  CampusItem(this.campus, this.image);

  void selectCampus(BuildContext ctx) {
    // Navigator.of(ctx).pushNamed(
    //   FacultyScreen.routeName,
    //   arguments: {
    //     'campus': campus,
    //   },
    // );
    Navigator.push(
      ctx,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => FacultyScreen(
          // availableFaculty: _availableFaculties,
          campus: campus,
        ),
        transitionDuration: Duration(seconds: 0),
      ),
    );
    // Navigator.push(
    //   ctx,
    //   PageRouteBuilder(
    //     pageBuilder: (context, animation1, animation2) => FacultyScreen(
    //       availableFaculty: _availableFaculties,
    //       campusTitle: title,
    //     ),
    //     transitionDuration: Duration(seconds: 2),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    var width = double.infinity;
    var height = MediaQuery.of(context).size.height / 4.1;
    // print(image);
    return InkWell(
      onTap: () => selectCampus(context),
      splashColor: Theme.of(context).accentColor,
      // borderRadius: BorderRadius.circular(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Theme.of(context).accentColor),
        ),
        elevation: 4,
        margin: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 8,
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.network(
                image,
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              // height: 50,
              width: 396,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Theme.of(context).backgroundColor,
                ),
                // width: 390,
                padding: EdgeInsets.all(10),
                child: Text(
                  campus,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
