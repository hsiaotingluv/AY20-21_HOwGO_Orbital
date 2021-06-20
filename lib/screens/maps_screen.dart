import 'package:flutter/material.dart';

class MapsScreen extends StatelessWidget {
  static const routeName = '/maps';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: Center(
        child: Text('Maps'),
      ),
    );
  }
}
