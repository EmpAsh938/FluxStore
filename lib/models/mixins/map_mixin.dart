import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../common/config.dart';
import '../../widgets/map/autocomplete_search_input.dart';
import '../entities/prediction.dart';

mixin MapMixin {
  Prediction? currentLocation;
  Set<Circle> circles = <Circle>{};
  Set<Marker> markers = <Marker>{};

  GoogleMapController? mapController;
  CameraPosition? currentUserLocation;

  var zoom = 15.0;
  var radius = kAdvanceConfig.queryRadiusDistance * 1.0;
  var minRadius = kAdvanceConfig.minQueryRadiusDistance * 1.0;
  var maxRadius = kAdvanceConfig.maxQueryRadiusDistance * 1.0;

  void updateRadius(double radius) {
    this.radius = radius;
    circles = {
      Circle(
        circleId: const CircleId('currentLocation'),
        center: currentLocation?.latLng ?? const LatLng(0, 0),
        radius: this.radius * 1000,
        fillColor: Colors.blue.withOpacity(0.3),
        strokeColor: Colors.blue,
        strokeWidth: 1,
      )
    };
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onGeoChanged(CameraPosition position) {
    zoom = position.zoom;
  }

  Future<Prediction?> getUserCurrentLocation() async {
    print("inside the map mixin");
    var location = Location();
    await location.changeSettings(
      accuracy: LocationAccuracy.high, // Ensures high accuracy
      interval: 1000, // Update interval in milliseconds
      distanceFilter: 0, // Updates location on every movement
    );
    print("location instance is ${location.getLocation()}");
    var locationData = await location.getLocation();
    print("location data is $locationData");
    currentLocation = Prediction()
      ..lat = locationData.latitude?.toString()
      ..long = locationData.longitude?.toString();
    print('map mixin current lat is ${locationData.latitude}');
    print('map mixin current long is ${locationData.longitude}');
    currentUserLocation = CameraPosition(
      target: currentLocation!.latLng,
      zoom: zoom,
    );
    circles = {
      Circle(
        circleId: const CircleId('currentLocation'),
        center: currentLocation!.latLng,
        radius: radius * 1000,
        fillColor: Colors.blue.withOpacity(0.3),
        strokeColor: Colors.blue,
        strokeWidth: 1,
      )
    };

    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(
            double.parse(currentLocation!.lat.toString()),
            double.parse(currentLocation!.long.toString()));

    if (placemarks.isNotEmpty) {
      geocoding.Placemark place = placemarks.first;

      currentLocationSet(
          '${place.street},${place.subLocality},${place.locality},${place.administrativeArea},${place.country}');
    }

    return currentLocation;
  }

  void updateCurrentLocation(Prediction prediction) {
    currentLocation = prediction;
    moveToCurrentPos();
    updateRadius(radius);
  }

  void moveToCurrentPos() {
    if (currentLocation != null) {
      print(
          ',,,move Location.....${currentLocation!.long}....${currentLocation!.lat}');
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          target: currentLocation!.latLng,
          zoom: zoom,
        )),
      );
    }
  }

  void zoomIn() {
    mapController?.animateCamera(CameraUpdate.zoomIn());
  }

  void zoomOut() {
    mapController?.animateCamera(CameraUpdate.zoomOut());
  }
}
