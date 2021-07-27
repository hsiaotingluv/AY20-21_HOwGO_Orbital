import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/building_screen.dart';

class FacultyItem extends StatelessWidget {
  final String faculty;
  final String campus;
  final String image;

  FacultyItem({
    @required this.campus,
    @required this.faculty,
    this.image,
  });

  void selectFaculty(BuildContext ctx) {
    // Navigator.of(ctx).pushNamed(
    //   BuildingScreen.routeName,
    //   arguments: {
    //     'campus': campus,
    //     'faculty': faculty,
    //   },
    // );
    Navigator.push(
      ctx,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => BuildingScreen(
          // availableFaculty: _availableFaculties,
          campus: campus,
          faculty: faculty,
        ),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectFaculty(context),
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
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                image,
                height: 24.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              // height: 50,
              width: 98.w,
              child: Container(
                height: 4.5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Theme.of(context).backgroundColor,
                ),
                // width: 390,
                padding: EdgeInsets.only(
                  top: 0.8.h,
                ),
                child: Text(
                  faculty,
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
