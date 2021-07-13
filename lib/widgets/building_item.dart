import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/room_screen.dart';

class BuildingItem extends StatelessWidget {
  final String title;
  final String campus;

  BuildingItem({
    @required this.title,
    @required this.campus,
  });

  void selectBuilding(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      RoomScreen.routeName,
      arguments: {
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55.sp,
          padding: const EdgeInsets.only(top: 15, left: 5),
          child: InkWell(
            onTap: () => selectBuilding(context),
            splashColor: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              // height: 85,
              // padding: const EdgeInsets.only(top: 11, left: 5),
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
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
