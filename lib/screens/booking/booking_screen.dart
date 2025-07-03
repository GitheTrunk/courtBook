import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Initialize with a default marker, you can update its position dynamically
  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('default_marker'),
      position: LatLng(0.0, 0.0), // Default position, will be updated
      infoWindow: InfoWindow(title: 'Default Location'),
    ),
  };

  // Initial camera position for the map.
  // You might want to set this to a more relevant location, e.g., your current city.
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.7749, -122.4194), // Example: San Francisco coordinates
    zoom: 12,
  );

  GoogleMapController? _mapController;

  // Function to move the camera to a new location
  void _goToNewLocation(LatLng newLocation) {
    _mapController?.animateCamera(CameraUpdate.newLatLng(newLocation));
    // Optionally, you can also update the marker's position
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('selected_location'),
          position: newLocation,
          infoWindow: InfoWindow(title: 'New Selected Location'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // Use Expanded to make the map take available space
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
                // You can add logic here to move the camera or add more markers
                // once the map is created.
                // For example, to move to a specific location:
                // _mapController?.animateCamera(CameraUpdate.newLatLng(LatLng(34.0522, -118.2437))); // Example: Los Angeles
              },
              myLocationEnabled: true, // Shows current location dot
              myLocationButtonEnabled:
                  true, // Shows button to recenter on current location
              zoomControlsEnabled: true, // Shows zoom in/out buttons
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              rotateGesturesEnabled: true,
            ),
          ),
          // You can add other widgets below the map, e.g., booking details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Your Location',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Logic for booking or selecting a location
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Location selected! (Placeholder)'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Confirm Location'),
                  ),
                  const SizedBox(height: 10), // Added spacing
                  ElevatedButton(
                    onPressed: () {
                      _goToNewLocation(
                        LatLng(11.5564, 104.9282), // Phnom Penh coordinates
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Different color for distinction
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Go to ACE Club'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
