import 'package:flutter/material.dart';

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
    var width = double.infinity;
    var height = MediaQuery.of(context).size.height / 4;
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
          vertical: 6,
          horizontal: 8,
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
