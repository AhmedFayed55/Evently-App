import 'package:evently_app/core/firebase/firestore_handler.dart';
import 'package:evently_app/features/add_event/data/models/event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> events = [];
  bool isLoading = false;

  List<Event> favoriteEvents = [];
  bool isFavoriteLoading = false;

  Future<void> fetchAllEvents() async {
    events = [];
    notifyListeners();

    isLoading = true;
    notifyListeners();

    events = await FireStoreHandler.getAllEvents();

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchEventsByCategory(String category) async {
    events = [];
    notifyListeners();

    isLoading = true;
    notifyListeners();

    events = await FireStoreHandler.getEventsByCategory(category);

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchFavoriteEvents() async {
    favoriteEvents = [];
    notifyListeners();

    isFavoriteLoading = true;
    notifyListeners();

    favoriteEvents = await FireStoreHandler.getMyFavorite(
      FirebaseAuth.instance.currentUser!.uid,
    );

    isFavoriteLoading = false;
    notifyListeners();
  }
}
