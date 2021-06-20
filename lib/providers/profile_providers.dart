import 'package:flutter/material.dart';

import '../category_data.dart';
import '../models/profile.dart';

class Profiles with ChangeNotifier {
  List<Profile> _profile = PROFILES;

  List<Profile> get profiles {
    return [..._profile];
  }

  void editProfile(String name, String major) {
    _profile.removeLast();
    Profile editedProfile = Profile(name, major);
    _profile.add(editedProfile);
    notifyListeners();
  }
}
