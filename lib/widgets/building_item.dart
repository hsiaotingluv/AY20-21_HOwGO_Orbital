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
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 75,
            padding: const EdgeInsets.only(top: 7),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyText2.color,
                ),
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
