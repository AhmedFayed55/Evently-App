import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:evently_app/core/firebase/firestore_handler.dart';
import 'package:evently_app/features/add_event/data/models/event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locationImport;

class EventsProvider extends ChangeNotifier {
  List<Event> events = [];
  bool isLoading = false;

  List<Event> favoriteEvents = [];
  bool isFavoriteLoading = false;

  LatLng? eventLocation;
  locationImport.Location location = locationImport.Location();
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

    List<Event> fetchedEvents = await FireStoreHandler.getAllEvents();

    for (var event in fetchedEvents) {
      if (event.lat != null && event.lng != null) {
        Map<String, String> location = await _getLocationFromCoordinates(
            event.lat!, event.lng!);
        event.city = location['city'];
        event.country = location['country'];
      }
    }

    events = fetchedEvents;
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
    locationImport.LocationData locationData = await location.getLocation();
    changeLocationOnMap(locationData);
  }

  Future<bool> _getLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == locationImport.PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == locationImport.PermissionStatus.granted;
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
        accuracy: locationImport.LocationAccuracy.high,
        interval: 1000 // كل ثانية
    );
    location.onLocationChanged.listen((locationData) {
      changeLocationOnMap(locationData);
    });
  }

  void changeLocationOnMap(locationImport.LocationData locationData) {
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

  Future<Map<String, String>> _getLocationFromCoordinates(double latitude,
      double longitude) async {
    try {
      if (latitude < -90 || latitude > 90 || longitude < -180 ||
          longitude > 180) {
        return {'city': 'Invalid Coordinates', 'country': ''};
      }

      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return {'city': 'No Internet', 'country': ''};
      }

      List<Placemark> placeMarks = await placemarkFromCoordinates(
          latitude, longitude);
      if (placeMarks.isNotEmpty) {
        Placemark placeMark = placeMarks.first;
        return {
          'city': placeMark.locality ?? placeMark.administrativeArea ??
              'Unknown',
          'country': placeMark.country ?? 'Unknown',
        };
      }
      return {'city': 'Unknown', 'country': 'Unknown'};
    } catch (e) {
      print('Geocoding Error: $e');
      if (e.toString().contains('Network')) {
        return {'city': 'No Internet', 'country': ''};
      } else if (e.toString().contains('API')) {
        return {'city': 'API Key Error', 'country': ''};
      }
      return {'city': 'Error', 'country': 'Contact Support'};
    }
  }
}
