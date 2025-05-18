import 'package:evently_app/core/firebase/firestore_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user.dart' as my_user;

class UserProvider extends ChangeNotifier {
  my_user.User? user;
  bool isLoading = false;

  getUser() async {
    isLoading = true;
    notifyListeners();
    user = await FireStoreHandler.getUser(
      FirebaseAuth.instance.currentUser!.uid,
    );
    isLoading = false;
    notifyListeners();
  }
}
