import 'package:flutter/material.dart';

import '../widgets/navigation_bar.dart';
import '../widgets/faculty_item.dart';
import '../models/faculty.dart';

class FacultyScreen extends StatefulWidget {
  static const routeName = '/faculty';

  final List<Faculty> availableFaculty;
  String campusTitle;

  FacultyScreen({
    @required this.availableFaculty,
    this.campusTitle,
  });

  @override
  _FacultyScreenState createState() => _FacultyScreenState();
}

class _FacultyScreenState extends State<FacultyScreen> {
  // String campusTitle;
  // _FacultyScreenState(this.campusTitle);
  List<Faculty> displayedFaculty;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      // final routeArgs =
      //     ModalRoute.of(context).settings.arguments as Map<String, String>;
      // campusTitle = routeArgs['title'];
      displayedFaculty = widget.availableFaculty.where((faculty) {
        return faculty.campus.contains(widget.campusTitle);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Faculty'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: displayedFaculty.length == 0
          ? Center(
              child: Text(
                'No data has been added for this campus yet. Try another campus.',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return FacultyItem(
                  title: displayedFaculty[index].name,
                  campus: displayedFaculty[index].campus,
                  image: displayedFaculty[index].image,
                );
              },
              itemCount: displayedFaculty.length,
              padding: EdgeInsets.all(5),
            ),
      bottomNavigationBar: NavigationBar(0),
    );
  }
}
