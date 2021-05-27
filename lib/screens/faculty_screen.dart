import 'package:flutter/material.dart';
import '../widgets/faculty_item.dart';

import '../models/faculty.dart';

class FacultyScreen extends StatefulWidget {
  static const routeName = '/faculty';

  final List<Faculty> availableFaculty;

  FacultyScreen(this.availableFaculty);

  @override
  _FacultyScreenState createState() => _FacultyScreenState();
}

class _FacultyScreenState extends State<FacultyScreen> {
  String campusTitle;
  List<Faculty> displayedFaculty;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      campusTitle = routeArgs['title'];
      displayedFaculty = widget.availableFaculty.where((faculty) {
        return faculty.campus.contains(campusTitle);
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
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return FacultyItem(
            title: displayedFaculty[index].title,
            campus: displayedFaculty[index].campus,
            image: displayedFaculty[index].image,
          );
        },
        itemCount: displayedFaculty.length,
        padding: EdgeInsets.all(5),
      ),
    );
  }
}
