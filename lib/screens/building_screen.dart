import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/building.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/building_item.dart';

// class BuildingScreen extends StatefulWidget {
//   static const routeName = '/building';

//   final List<Building> availableBuildings;

//   BuildingScreen(this.availableBuildings);

//   @override
//   _BuildingScreenState createState() => _BuildingScreenState();
// }

// class _BuildingScreenState extends State<BuildingScreen> {
//   String facultyTitle;
//   List<Building> displayedBuildings;
//   var _loadedInitData = false;

//   @override
//   void didChangeDependencies() {
//     if (!_loadedInitData) {
//       final routeArgs =
//           ModalRoute.of(context).settings.arguments as Map<String, String>;
//       facultyTitle = routeArgs['title'];
//       displayedBuildings = widget.availableBuildings.where((building) {
//         return building.faculty.contains(facultyTitle);
//       }).toList();
//       _loadedInitData = true;
//     }
//     super.didChangeDependencies();
//   }

class BuildingScreen extends StatelessWidget {
  static const routeName = '/building';

  final String campus;
  final String faculty;

  BuildingScreen({
    this.campus,
    this.faculty,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Building'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('campus/${campus}/faculty/${faculty}/building')
              .get(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> displayedBuildings =
                  snapshot.data.docs;
              return displayedBuildings.length == 0
                  ? Center(
                      child: Text(
                        'No data has been added for this faculty yet. Try another faculty.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: displayedBuildings
                              .map((building) => BuildingItem(
                                    campus: campus,
                                    faculty: faculty,
                                    building: building['name'],
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
              //       return BuildingItem(
              //         title: displayedBuildings[index].title,
              //         campus: displayedBuildings[index].campus,
              //       );
              //     },
              //     itemCount: displayedBuildings.length,
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
