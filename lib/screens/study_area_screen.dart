import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/navigation_bar.dart';
import '../widgets/study_area_item.dart';

class StudyAreasScreen extends StatefulWidget {
  static const routeName = '/study';

  @override
  _StudyAreasScreenState createState() => _StudyAreasScreenState();
}

class _StudyAreasScreenState extends State<StudyAreasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Study Area'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('allStudyAreas').get(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> displayedRooms = snapshot.data.docs;
              return displayedRooms.length == 0
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'No data has been added for this building yet. Try another building.',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: displayedRooms
                              .map((room) => StudyAreaItem(
                                    selectedRoom: room,
                                  ))
                              .toList(),
                        ),
                      ],
                    );
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: NavigationBar(3),
    );
  }
}
