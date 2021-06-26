import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context) async {
    return await FirebaseStorage.instance
        .ref('SoC/COM1/COM1-0217/direction/')
        // .child(Image)
        .listAll();
    // .getDownloadURL();
  }
}
