import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../providers/firestorageservice_provider.dart';

class DirectionScreen extends StatelessWidget {
  final List<String> direction;
  final List<String> caption;

  DirectionScreen(this.direction, this.caption);

  // int _index;

  // final ref = FirebaseStorage.instance
  //     .ref()
  //     .child('SoC')
  //     .child('COM1')
  //     .child('COM1-0217')
  //     .child('direction')
  //     .child('COM1-0217_direction_1.png');

  // var url = Uri.parse(await ref.getDownloadURL() as String);

  // Future<Widget> _getImage(BuildContext context) async {
  //   await Firebase.initializeApp();
  //   Image image;
  //   await FireStorageService.loadImage(context).then((value) {
  //     image = Image.network(
  //       value.toString(),
  //       fit: BoxFit.scaleDown,
  //     );
  //   });
  //   return image;
  // }

  Future<dynamic> _getImages(BuildContext context) async {
    await Firebase.initializeApp();
    List<Image> images = [];
    await FireStorageService.loadImage(context).then((list) {
      list.items.forEach((image) {
        if (image != null) {
          images.add(Image.network(
            image.toString(),
          ));
        }
      });
    });
    return images;
  }

  // Future<void> listExample() async {
  //   firebase_storage.ListResult result =
  //       await firebase_storage.FirebaseStorage.instance
  //           .ref('SoC/COM1/COM1-0217/direction/')
  //           // .ref()
  //           // .child('SoC')
  //           // .child('COM1')
  //           // .child('COM1-0217')
  //           // .child('direction')
  //           .listAll();

  //   result.items.forEach((firebase_storage.Reference ref) {
  //     print('Found file: $ref');
  //     Text('hello world');
  //   });

  //   result.prefixes.forEach((firebase_storage.Reference ref) {
  //     print('Found directory: $ref');
  //   });

  //   // return result;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Direction')),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: FutureBuilder(
            future: _getImages(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.width / 1.2,
                  child: snapshot.data[1],
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
