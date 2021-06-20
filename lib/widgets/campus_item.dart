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
    var height = MediaQuery.of(context).size.height / 4.5;
    return InkWell(
      onTap: () => selectCampus(context),
      splashColor: Colors.amber.shade200,
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          // Container(
          //   padding: EdgeInsets.only(top: 5, left: 10),
          //   height: 35,
          //   width: width,
          //   child: Text(
          //     title,
          //     style: TextStyle(
          //       fontSize: 25,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          Container(
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
                  // bottom: 20,
                  // right: 10,
                  top: 10,
                  left: 20,
                  child: Container(
                    width: 300,
                    color: Colors.white24,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
