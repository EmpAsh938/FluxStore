import 'dart:convert' as convert;
import 'dart:convert';

import 'package:fstore/models/entities/product.dart';
import 'package:fstore/services/services.dart';
import 'package:inspireui/inspireui.dart';
import 'package:quiver/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/store.dart';

class StoreLocatorServices {
  final domain = Services().api.domain;

  Future<List<Store>> getStores(
      {String? latitude,
      String? longitude,
      double? radius,
      bool? showAll}) async {
    try {
      var url =
          '$domain/wp-json/api/flutter_store_locator/stores?show_all=${showAll == true}';
      if (latitude != null && longitude != null) {
        url += '&latitude=$latitude&longitude=$longitude';
      }
      if (radius != null) {
        url += '&radius=$radius';
      }
      var response = await httpGet(Uri.parse(url),
          headers: {'Content-Type': 'application/json'}, refreshCache: true);
      var jsonDecode = convert.jsonDecode(response.body);
      print("REEESPSONSE ${response.body}");
      var stores = <Store>[];

      if (jsonDecode is Map && isNotBlank(jsonDecode['message'])) {
        throw Exception(jsonDecode['message']);
      } else {
        if (jsonDecode is List) {
          for (var item in jsonDecode) {
            stores.add(Store.fromJson(item));
          }
        }
        return stores;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>> getProducts(
      {required String storeId, int page = 1, int perPage = 70}) async {
    try {
      var url =
          'https://www.hakkaexpress.com/wp-json/wc/v3/products?status=publish&lang=en&page=$page&per_page=$perPage&is_all_data=false&consumer_key=ck_7abac2cafb82576fc9a5ff2b8fad8f4b2e8d9eef&consumer_secret=cs_1c2b2f22a439de18cd23fadd91e8a28cdb48b42a';

      var response = await httpGet(Uri.parse(url),
          headers: {'Content-Type': 'application/json'});
      var jsonDecode = convert.jsonDecode(response.body);
      var products = <Product>[];

      if (jsonDecode is Map && isNotBlank(jsonDecode['message'])) {
        throw Exception(jsonDecode['message']);
      } else {
        if (jsonDecode is List) {
          for (var item in jsonDecode) {
            var product = Product.fromJson(item);
            if (product.type == 'yith-composite') {
              products.add(product);
            }
          }
        }
        return products;
      }
    } catch (e) {
      rethrow;
    }
  }
}

class SaveStoreLocation {
  static const String _key = "store_map";
  static const String _storeKey = "store_key";

  static Future<void> saveMap(Map<String, String> map) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(map); // Convert map to JSON string
    await prefs.setString(_key, jsonString);
  }

  static Future<void> saveStore(Store store) async {
    final prefs = await SharedPreferences.getInstance();

    // Convert the Store object to a JSON-compatible map
    final Map<String, dynamic> storeMap = store.toJson();

    // Encode the map to a JSON string
    final String jsonString = jsonEncode(storeMap);

    // Save the JSON string to SharedPreferences
    await prefs.setString(_storeKey, jsonString);
  }

  static Future<Map<String, String>> getMap() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_key);

    if (jsonString == null) return {};

    return Map<String, String>.from(
        jsonDecode(jsonString)); // Convert JSON string back to Map
  }

  static Future<Store> getStore() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_storeKey);

    // If no data is found, return a default/empty Store object
    if (jsonString == null) {
      return Store(); // Assuming Store has a default constructor
    }

    try {
      // Decode the JSON string and convert it to a Store object
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return Store.fromJson(jsonMap);
    } catch (e) {
      // Handle JSON decoding errors
      print('Error decoding Store from JSON: $e');
      return Store(); // Return a default/empty Store object in case of error
    }
  }
}
