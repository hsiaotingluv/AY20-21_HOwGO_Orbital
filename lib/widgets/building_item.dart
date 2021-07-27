import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/room_screen.dart';

class BuildingItem extends StatelessWidget {
  final String building;
  final String image;
  final String campus;
  final String faculty;

  BuildingItem({
    this.building,
    this.image,
    this.campus,
    this.faculty,
  });

  void selectBuilding(BuildContext ctx) {
    Navigator.push(
      ctx,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => RoomScreen(
          campus: campus,
          faculty: faculty,
          building: building,
        ),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(image);
    return InkWell(
      onTap: () => selectBuilding(context),
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
                  building,
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
  //////
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       InkWell(
  //         onTap: () => selectBuilding(context),
  //         splashColor: Theme.of(context).accentColor,
  //         borderRadius: BorderRadius.circular(10),
  //         child: Container(
  //           height: 75,
  //           padding: const EdgeInsets.only(top: 7),
  //           child: ListTile(
  //             title: Text(
  //               building,
  //               style: Theme.of(context).textTheme.headline1,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Divider(
  //         height: 0,
  //         thickness: 0.5,
  //         color: Theme.of(context).dividerColor,
  //         indent: 15,
  //         endIndent: 15,
  //       ),
  //     ],
  //   );
  // }
}
