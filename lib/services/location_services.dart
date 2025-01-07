import 'dart:async';

import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();
  final StreamController<LocationData> _locationStreamController = StreamController<LocationData>.broadcast();

  Stream<LocationData> get locationStream => _locationStreamController.stream;

  LocationService() {
    _initLocationStream();
  }

  Future<void> _initLocationStream() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen((LocationData locationData) {
      _locationStreamController.add(locationData);
    });
  }

  // Get the current location
  Future<LocationData?> getLocation() async {
    try {
      bool serviceEnabled;
      PermissionStatus permissionGranted;

      serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          return null;
        }
      }

      permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return null;
        }
      }

      return await _location.getLocation();
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  // Update the location stream (add a new event)
  void updateLocationStream(LocationData locationData) {
    _locationStreamController.add(locationData);
  }
}