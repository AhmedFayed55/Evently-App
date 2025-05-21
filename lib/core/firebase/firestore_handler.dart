import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/add_event/data/models/event.dart';

import '../../models/user.dart';

class FireStoreHandler {
  static CollectionReference<User> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(AppStrings.userCollection)
        .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromFireStore(snapshot.data()),
          toFirestore: (user, _) => user.toFireStore(),
        );
  }

  static Future<void> addUser(User user) {
    CollectionReference<User> collection = getUserCollection();
    DocumentReference<User> doc = collection.doc(user.id);
    return doc.set(user);
  }

  static Future<User?> getUser(String uId) async {
    CollectionReference<User> collection = getUserCollection();
    DocumentReference<User> document = collection.doc(uId);
    var snapshot = await document.get();
    return snapshot.data();
  }

  static CollectionReference<Event> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(AppStrings.eventsCollection)
        .withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromFireStore(snapshot.data()),
          toFirestore: (event, _) => event.toFireStore(),
        );
  }

  static Future<void> createEvent(Event event) {
    CollectionReference<Event> collection = getEventCollection();
    DocumentReference<Event> doc = collection.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<List<Event>> getAllEvents() async {
    CollectionReference<Event> collection = getEventCollection();
    var querySnapshot = await collection.get();
    var docList = querySnapshot.docs;
    var eventList = docList.map((doc) => doc.data(),).toList();
    eventList.sort((event1, event2) {
      final date1 = event1.date ?? Timestamp.now();
      final date2 = event2.date ?? Timestamp.now();
      return date1.compareTo(date2);
    });
    return eventList;
  }

  static Future<List<Event>> getEventsByCategory(String category) async {
    var collection = getEventCollection().where(
        "category", isEqualTo: category);
    var querySnapshot = await collection.get();
    var docList = querySnapshot.docs;
    var eventList = docList.map((doc) => doc.data()).toList();

    eventList.sort((event1, event2) {
      final date1 = event1.date ?? Timestamp.now();
      final date2 = event2.date ?? Timestamp.now();
      return date1.compareTo(date2);
    });
    return eventList;
  }

  static CollectionReference<Event> getFavoriteCollection(String uID) {
    var collection = getUserCollection().doc(uID).collection(
        AppStrings.favoriteCollection)
        .withConverter<Event>(
      fromFirestore: (snapshot, _) => Event.fromFireStore(snapshot.data()),
      toFirestore: (event, _) => event.toFireStore(),
    );
    return collection;
  }

  static Future<void> addToFavorite(String uID, Event event) {
    var collection = getFavoriteCollection(uID);
    var doc = collection.doc(event.id);
    return doc.set(event);
  }

  static Future<void> removeFromFavorite(String uID, String eventId) {
    var collection = getFavoriteCollection(uID);
    return collection.doc(eventId).delete();
  }

  static Future<List<Event>> getMyFavorite(String uId) async {
    var collection = getFavoriteCollection(uId);
    var querySnapshot = await collection.get();
    var docList = querySnapshot.docs;
    var eventList = docList.map((doc) => doc.data()).toList();

    eventList.sort((event1, event2) {
      final date1 = event1.date ?? Timestamp.now();
      final date2 = event2.date ?? Timestamp.now();
      return date1.compareTo(date2);
    });

    return eventList;
  }

  static Future<void> updateUserFavorites(String uId,
      List<String> newFavorites) {
    var collection = getUserCollection();
    var doc = collection.doc(uId);
    return doc.update({
      "favorites": newFavorites
    });
  }
}
