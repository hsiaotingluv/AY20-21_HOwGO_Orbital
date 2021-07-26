import 'package:flutter/material.dart';

import '../screens/room_screen.dart';

class BuildingItem extends StatelessWidget {
  final String campus;
  final String faculty;
  final String building;
  // final String campus;

  BuildingItem({
    @required this.campus,
    @required this.faculty,
    @required this.building,
    // @required this.campus,
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
    return Column(
      children: [
        InkWell(
          onTap: () => selectBuilding(context),
          splashColor: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 75,
            padding: const EdgeInsets.only(top: 7),
            child: ListTile(
              title: Text(
                building,
                style: Theme.of(context).textTheme.headline1,
              ),
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
    );
  }
}
