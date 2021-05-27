import 'package:flutter/material.dart';

import '../category_data.dart';
import '../widgets/campus_item.dart';

class CampusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: CAMPUS_CATEGORIES
            .map((campus) => CampusItem(campus.title, campus.image))
            .toList(),
      ),
    );
  }
}
