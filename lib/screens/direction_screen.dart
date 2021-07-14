import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

import '../models/room.dart';

class DirectionScreen extends StatelessWidget {
  final DocumentSnapshot<Object> room;

  DirectionScreen(this.room);

  // Future<List<String>> _getImages(BuildContext context) async {
  //   await Firebase.initializeApp();
  //   List<String> imagesUrl = [];
  //   final ListResult result = await FirebaseStorage.instance
  //       .ref('SoC/COM1/COM1-02-17/direction/')
  //       .list();
  //   final List<Reference> allFiles = result.items;
  //   await Future.forEach<Reference>(allFiles, (file) async {
  //     final String fileUrl = await file.getDownloadURL();
  //     imagesUrl.add(fileUrl.toString());
  //   });
  //   return imagesUrl;
  // }

  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<Map<String, String>> getDirection() async {
  //   await Firebase.initializeApp();
  //   final Map<String, String> content = new Map();

  //   Query direction = FirebaseFirestore.instance
  //       .collection('campus')
  //       .doc('Kent Ridge Campus')
  //       .collection('faculty')
  //       .doc('School of Computing')
  //       .collection('building')
  //       .doc(room.building)
  //       .collection('room')
  //       .doc(room.name)
  //       .collection('direction');
  //   // .orderBy('direction');

  //   final result = await direction.get();
  //   for (final item in result.docs) {
  //     final imageUrl = item['imageUrl'];
  //     final caption = item['caption'];
  //     content[imageUrl] = caption;
  //   }
  //   return content;
  // }

  // Future<DocumentSnapshot<Map<String, dynamic>>> getDirection() async {
  //   await Firebase.initializeApp();
  //   return await FirebaseFirestore.instance
  //       .collection(
  //           '/campus/Kent Ridge Campus/faculty/School of Computing/building/COM1/room')
  //       .doc('Tutorial Room 10')
  //       .get();
  // }

  @override
  Widget build(BuildContext context) {
    var direction = room['direction'];
    return Scaffold(
        appBar: AppBar(title: Text('Direction')),
        backgroundColor: Theme.of(context).backgroundColor,
        body: ListView.builder(
            itemCount: direction.length ?? 0,
            itemBuilder: (_, index) {
              return direction == null
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'No data has been added for this room yet. Try another room.',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Image.network(direction[index]['url']),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(15),
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            direction[index]['caption'],
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
            }));
  }
}
