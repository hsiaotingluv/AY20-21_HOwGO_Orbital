import 'package:flutter/material.dart';

import '../screens/faculty_screen.dart';

class CampusItem extends StatelessWidget {
  final String title;
  final String image;

  CampusItem(this.title, this.image);

  void selectCampus(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      FacultyScreen.routeName,
      arguments: {
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = double.infinity;
    var height = MediaQuery.of(context).size.height / 4.1;
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
              child: Image.asset(
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
                  title,
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



// Positioned(
//   bottom: 0,
//   // right: 10,
//   // top: 10,
//   // left: 20,
//   child: Container(
//     width: 400,
//     color: Colors.white,
//     padding: EdgeInsets.symmetric(
//       vertical: 10,
//       horizontal: 20,
//     ),
//     child: Text(
//       title,
//       textAlign: TextAlign.center,
//       style: Theme.of(context).textTheme.headline1,
//       // style: TextStyle(
//       //   fontFamily: 'Roboto',
//       //   fontSize: 25,
//       //   color: Colors.black,
//       //   fontWeight: FontWeight.bold,
//       // ),
//       softWrap: true,
//       overflow: TextOverflow.fade,
//     ),
//   ),
// ),