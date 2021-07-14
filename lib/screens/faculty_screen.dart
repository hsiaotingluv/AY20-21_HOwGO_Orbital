import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/navigation_bar.dart';
import '../widgets/faculty_item.dart';
import '../models/faculty.dart';

// class FacultyScreen extends StatefulWidget {
//   static const routeName = '/faculty';

//   final List<Faculty> availableFaculty;
//   String campusTitle;

//   FacultyScreen({
//     @required this.availableFaculty,
//     this.campusTitle,
//   });

//   @override
//   _FacultyScreenState createState() => _FacultyScreenState();
// }

// class _FacultyScreenState extends State<FacultyScreen> {
//   // String campusTitle;
//   // _FacultyScreenState(this.campusTitle);
//   List<Faculty> displayedFaculty;
//   var _loadedInitData = false;

//   @override
//   void didChangeDependencies() {
//     if (!_loadedInitData) {
//       // final routeArgs =
//       //     ModalRoute.of(context).settings.arguments as Map<String, String>;
//       // campusTitle = routeArgs['title'];
//       displayedFaculty = widget.availableFaculty.where((faculty) {
//         return faculty.campus.contains(widget.campusTitle);
//       }).toList();
//       _loadedInitData = true;
//     }
//     super.didChangeDependencies();
//   }

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
              .collection('campus/${campus}/faculty')
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
                          'No data has been added for this campus yet. Try another campus.',
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
              // : ListView.builder(
              //     itemBuilder: (ctx, index) {
              //       return FacultyItem(
              //         title: displayedFaculty[index].name,
              //         campus: displayedFaculty[index].campus,
              //         image: displayedFaculty[index].image,
              //       );
              //     },
              //     itemCount: displayedFaculty.length,
              //     padding: EdgeInsets.all(5),
              //   );
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
