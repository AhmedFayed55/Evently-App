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
}
