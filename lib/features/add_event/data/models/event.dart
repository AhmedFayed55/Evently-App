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
  String? city;
  String? country;

  Event({
    this.id,
    this.uId,
    this.title,
    this.description,
    this.category,
    this.imagePath,
    this.date,
    this.lat,
    this.lng,
    this.city,
    this.country
  });

  Event.fromFireStore(Map<String, dynamic>? data) {
    id = data?["id"];
    uId = data?["uId"];
    title = data?["title"];
    description = data?["description"];
    category = data?["category"];
    imagePath = data?["imagePath"];
    date = data?["date"];
    lat = data?["lat"];
    lng = data?["lng"];
    city = data?["city"];
    country = data?["country"];
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
      "lat": lat,
      "lng": lng,
      "country": country,
      "city": city
    };
  }
}
