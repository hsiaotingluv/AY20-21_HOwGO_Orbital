import 'package:flutter/material.dart';

import '../screens/building_screen.dart';

class CampusItem extends StatelessWidget {
  final String title;

  CampusItem(this.title);

  void selectCampus(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      BuildingScreen.routeName,
      arguments: {
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCampus(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
