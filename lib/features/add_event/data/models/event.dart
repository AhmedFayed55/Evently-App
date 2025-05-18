import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String? id;
  String? uId;
  String? title;
  String? description;
  String? category;
  String? imagePath;
  Timestamp? date;
  double? lat;
  double? lng;
  bool? isFavorite;

  Event({
    this.id,
    this.uId,
    this.title,
    this.description,
    this.category,
    this.imagePath,
    this.date,
    this.isFavorite = false,
    this.lat,
    this.lng,
  });

  Event.fromFireStore(Map<String, dynamic>? data) {
    id = data?["id"];
    uId = data?["uId"];
    title = data?["title"];
    description = data?["description"];
    category = data?["category"];
    imagePath = data?["imagePath"];
    date = data?["date"];
    isFavorite = data?["isFavorite"];
    lat = data?["lat"];
    lng = data?["lng"];
  }

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "uId": uId,
      "title": title,
      "description": description,
      "category": category,
      "imagePath": imagePath,
      "date": date,
      "isFavorite": isFavorite,
      "lat": lat,
      "lng": lng,
    };
  }
}
