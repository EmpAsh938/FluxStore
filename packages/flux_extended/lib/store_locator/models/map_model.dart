// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:fstore/models/entities/prediction.dart';
import 'package:fstore/models/mixins/map_mixin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../services/index.dart';
import 'store.dart';

enum MapModelState { loading, loaded }

class MapModel extends ChangeNotifier with MapMixin {
  List<Store> stores = [];
  final _services = StoreLocatorServices();
  MapModelState state = MapModelState.loaded;

  bool showStores = false;

  MapModel() {
    currentUserLocation = CameraPosition(
      target: const LatLng(
        0.0,
        0.0,
      ),
      zoom: zoom,
    );
    // getStores(showAll: true);
  }

  void _updateState(state) {
    this.state = state;
    notifyListeners();
  }

  void _updateRadius(double radius) {
    super.updateRadius(radius);
    notifyListeners();
  }

  void getStores({double? radius, bool? showAll}) {
    if (radius != null) {
      _updateRadius(radius);
    }
    if (showAll != null) {
      showStores = showAll;
    }
    EasyDebounce.debounce('getStores', const Duration(milliseconds: 500),
        () async {
      if (state != MapModelState.loading) {
        _updateState(MapModelState.loading);
      }
      markers.clear();
      stores.clear();
      Store? firstStore;
      print("current lat is ${currentLocation?.lat}");
      print("current long is ${currentLocation?.long}");

      final mapData = await SaveStoreLocation.getAddress();

      print("MAPPPDATA");
      print(mapData);

      var userLat = mapData['latitude'] ?? currentLocation?.lat;
      var userLong = mapData['longitude'] ?? currentLocation?.long;

// Fetch store list from API
      var storeList = await _services.getStores(
        latitude: userLat,
        longitude: userLong,
        radius: this.radius,
        showAll: showAll,
      );

      // var list = await _services.getStores(
      //   latitude: mapData['latitude'],
      //   longitude: mapData['longitude'],
      //   radius: this.radius,
      //   showAll: false,
      // );

      // Sort stores by proximity to user
      storeList.sort((a, b) {
        double distanceA = calculateDistance(
            double.parse(userLat!),
            double.parse(userLong!),
            double.parse(a.latitude!),
            double.parse(a.longitude!));
        double distanceB = calculateDistance(
            double.parse(userLat!),
            double.parse(userLong!),
            double.parse(b.latitude!),
            double.parse(b.longitude!));
        return distanceA
            .compareTo(distanceB); // Sort in ascending order (closest first)
      });

      stores.addAll(storeList);
      for (var element in stores) {
        print("LAT: ${element.latitude} LONG: ${element.longitude}");
        if (double.tryParse(element.latitude ?? '') != null &&
            double.tryParse(element.longitude ?? '') != null) {
          firstStore ??= element;
          markers.add(
            Marker(
              markerId: MarkerId('map-${element.id}'),
              infoWindow: InfoWindow(
                title: '',
                onTap: () {},
              ),
              position: LatLng(double.tryParse(element.latitude!) ?? 0,
                  double.tryParse(element.longitude!) ?? 0),
            ),
          );
        }
      }
      if (firstStore != null) {
        currentUserLocation = CameraPosition(
          target: LatLng(double.tryParse(firstStore.latitude!) ?? 0,
              double.tryParse(firstStore.longitude!) ?? 0),
          zoom: zoom,
        );
      }
      _updateState(MapModelState.loaded);
    });
  }

  void onPageChange(Store store) {
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(double.tryParse(store.latitude!) ?? 0,
            double.tryParse(store.longitude!) ?? 0),
        zoom: zoom,
      )),
    );
    notifyListeners();
  }

  @override
  void updateCurrentLocation(Prediction prediction) {
    super.updateCurrentLocation(prediction);
    getStores();
  }

  @override
  Future<Prediction?> getUserCurrentLocation() async {
    Location location = Location();
    PermissionStatus _permissionGranted = PermissionStatus.denied;

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    if (_permissionGranted == PermissionStatus.granted) {
      currentLocation = await super.getUserCurrentLocation();
      getStores(showAll: true);
    }

    return currentLocation;
  }

  void showAllStores() {
    currentLocation = null;
    getStores(showAll: true);
  }

  // Haversine formula to calculate distance between two coordinates
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295; // Pi / 180
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)); // Distance in km
  }
}
