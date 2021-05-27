import 'package:flutter/material.dart';
import '../screens/building_screen.dart';
import '../screens/faculty_screen.dart';

import '../screens/room_screen.dart';

class FacultyItem extends StatelessWidget {
  final String title;
  final String campus;
  final String image;

  FacultyItem({@required this.title, @required this.campus, this.image});

  void selectFaculty(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      BuildingScreen.routeName,
      arguments: {
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = double.infinity;
    var height = MediaQuery.of(context).size.height / 3 - 90;
    return InkWell(
      onTap: () => selectFaculty(context),
      splashColor: Colors.amber.shade200,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(0),
        margin: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                image,
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                width: 200,
                color: Colors.black54,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return InkWell(
    //   onTap: () => selectFaculty(context),
    //   splashColor: Theme.of(context).primaryColor,
    //   borderRadius: BorderRadius.circular(15),
    //   child: Container(
    //     height: 100,
    //     padding: const EdgeInsets.only(top: 35, left: 15),
    //     child: Text(
    //       title,
    //       style: TextStyle(
    //         fontSize: 20,
    //       ),
    //     ),
    //     decoration: BoxDecoration(
    //       border: Border.all(
    //         width: 2,
    //       ),
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //     margin: EdgeInsets.all(5),
    //   ),
    // );
  }
}
