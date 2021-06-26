import 'package:flutter/material.dart';

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
        InkWell(
          onTap: () => selectBuilding(context),
          splashColor: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 75,
            padding: const EdgeInsets.only(top: 7),
            child: ListTile(
              title: Text(
                title,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ),
        Divider(
          height: 0,
          thickness: 1.5,
          color: Theme.of(context).dividerColor,
        ),
      ],
    );
  }
}
