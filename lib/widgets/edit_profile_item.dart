import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/profile_providers.dart';

class EditProfileItem extends StatefulWidget {
  @override
  _EditProfileItemState createState() => _EditProfileItemState();
}

class _EditProfileItemState extends State<EditProfileItem> {
  final nameController = TextEditingController();
  final majorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profiles>(context);
    return Card(
      elevation: 5,
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Major'),
              controller: majorController,
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  profile.editProfile(
                    nameController.text,
                    majorController.text,
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
