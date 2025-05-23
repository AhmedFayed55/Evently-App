import 'package:evently_app/core/firebase/firestore_handler.dart';
import 'package:evently_app/features/add_event/data/models/event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> events = [];
  bool isLoading = false;

  List<Event> favoriteEvents = [];
  bool isFavoriteLoading = false;

  LatLng? eventLocation;
  Location location = Location();
  String locationMessage = '';

  late GoogleMapController mapController;
  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 18.0,
  );

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId("0"),
      position: LatLng(37.42796133580664, -122.085749655962),
    )
  };

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

  Future<void> getLocation() async {
    bool locationPermissionGranted = await _getLocationPermission();
    if (!locationPermissionGranted) {
      return;
    }
    bool locationServiceEnabled = await _locationServiceEnabled();
    if (!locationServiceEnabled) {
      return;
    }
    notifyListeners();
    LocationData locationData = await location.getLocation();
    changeLocationOnMap(locationData);
  }

  Future<bool> _getLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> _locationServiceEnabled() async {
    bool locationServiceEnabled = await location.serviceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await location.requestService();
    }
    return locationServiceEnabled;
  }

  void setLocationListener() {
    location.changeSettings(
        accuracy: LocationAccuracy.high,
        interval: 1000 // كل ثانية
    );
    location.onLocationChanged.listen((locationData) {
      changeLocationOnMap(locationData);
    });
  }

  void changeLocationOnMap(LocationData locationData) {
    cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 17.0,
    );
    markers.add(
        Marker(
          markerId: MarkerId(UniqueKey().toString()),
          position: LatLng(
              locationData.latitude ?? 0, locationData.longitude ?? 0),
        )
    );
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    notifyListeners();
  }

  void changeLocation(LatLng newEventLocation) {
    eventLocation = newEventLocation;
    notifyListeners();
  }
}
