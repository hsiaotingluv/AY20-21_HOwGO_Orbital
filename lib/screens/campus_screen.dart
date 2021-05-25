import 'package:flutter/material.dart';

import '../category_data.dart';
import '../widgets/campus_item.dart';

class CampusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Campus'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: CAMPUS_CATEGORIES
            .map((campus) => CampusItem(campus.title))
            .toList(),
      ),
    );
  }
}
