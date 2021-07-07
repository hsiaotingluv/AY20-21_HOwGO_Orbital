import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/room.dart';

class DirectionScreen extends StatelessWidget {
  final RoomModel room;

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

  Future<Map<String, String>> getDirection() async {
    await Firebase.initializeApp();
    final Map<String, String> content = new Map();

    Query direction = FirebaseFirestore.instance
        .collection('campus')
        .doc('Kent Ridge Campus')
        .collection('faculty')
        .doc('School of Computing')
        .collection('building')
        .doc(room.building)
        .collection('room')
        .doc(room.name)
        .collection('direction');
    // .orderBy('direction');

    final result = await direction.get();
    for (final item in result.docs) {
      final imageUrl = item['imageUrl'];
      final caption = item['caption'];
      content[imageUrl] = caption;
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Direction')),
      backgroundColor: Theme.of(context).backgroundColor,
      // body: StreamBuilder(
      //     stream: FirebaseFirestore.instance
      //         .collection(
      //             '/campus/Kent Ridge Campus/faculty/School of Computing/building/COM1/room')
      //             .document(room.name)
      //         .snapshots(),
      //     builder: (ctx, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       var doc = snapshot.data;
      //       return Column(children: [Text('name: '),],);
      //     }),
      body: Container(
        child: FutureBuilder(
            // future: _getImages(context),
            future: getDirection(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      String key = snapshot.data.keys.elementAt(index);
                      return Column(
                        children: [
                          Image.network(key),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(15),
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              snapshot.data[key],
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
                    });
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
                    Center(
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
