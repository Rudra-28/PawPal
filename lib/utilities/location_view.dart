import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:pawpalforpets/services/location_services.dart';
// ... other imports

class LocationView extends StatefulWidget {
  final Stream<LocationData> locationStream;

  const LocationView({super.key, required this.locationStream});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final LocationService _locationService = LocationService(); 
  String? _manualLocation; // To store the manually entered location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display live location if available
            StreamBuilder<LocationData>(
              stream: widget.locationStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final location = snapshot.data!;
                  return Column(
                    children: [
                      Text('Latitude: ${location.latitude}'),
                      Text('Longitude: ${location.longitude}'),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error getting location');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),

            const SizedBox(height: 30),

            // "Around Me" button
            ElevatedButton(
              onPressed: () async {
                // Try to get the location again
                LocationData? locationData = await _locationService.getLocation();
                if (locationData != null) {
                  // Update the stream (you might need to adjust this based on your LocationService)
                  _locationService.updateLocationStream(locationData); 
                } else {
                  // Handle location retrieval failure (e.g., show a snackbar)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unable to get location. Please check your settings.'))
                  );
                }
              },
              child: const Text('Around Me'),
            ),

            const SizedBox(height: 20),

            // "Set Location Manually" section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your address',
                    ),
                    onChanged: (text) {
                      setState(() {
                        _manualLocation = text;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle setting the location manually
                      // (e.g., use geocoding to get coordinates from the address)
                      // and update your app's state accordingly
                    },
                    child: const Text('Set Location'),
                  ),
                ],
              ),
            ),

            // Display manual location if set
            if (_manualLocation != null) 
              Text('Manual Location: $_manualLocation'),
          ],
        ),
      ),
    );
  }
}