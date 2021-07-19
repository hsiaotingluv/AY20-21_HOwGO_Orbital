import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/navigation_bar.dart';
import '../widgets/faculty_item.dart';

class FacultyScreen extends StatelessWidget {
  static const routeName = '/faculty';
  final String campus;

  FacultyScreen({
    this.campus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Faculty'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('campus/$campus/faculty')
              .get(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> displayedFaculty =
                  snapshot.data.docs;
              return displayedFaculty.length == 0
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'No data has been added for this campus. \nTry another campus.',
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
                          children: displayedFaculty
                              .map((fac) => FacultyItem(
                                    faculty: fac['name'],
                                    campus: campus,
                                    image: fac['imageUrl'],
                                  ))
                              .toList(),
                          // children: CAMPUS_CATEGORIES
                          //     .map((campus) => CampusItem(campus.name, campus.image))
                          //     .toList(),
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
      bottomNavigationBar: NavigationBar(0),
    );
  }
}
