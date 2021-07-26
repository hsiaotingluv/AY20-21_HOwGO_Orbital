import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/faculty_screen.dart';

class CampusItem extends StatelessWidget {
  final String campus;
  final String image;

  CampusItem(this.campus, this.image);

  void selectCampus(BuildContext ctx) {
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
  }

  @override
  Widget build(BuildContext context) {
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
          vertical: 1.h,
          horizontal: 2.w,
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.network(
                image,
                height: 25.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              // height: 50,
              width: 98.w,
              child: Container(
                height: 6.h,
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
