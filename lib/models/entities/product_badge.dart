import '../../common/constants.dart';
import '../../common/tools.dart';
import '../../services/service_config.dart';

class ProductBadge {
  String? id;
  String? key;
  List<dynamic>? value; // The value can be a String, List, Map, etc.

  ProductBadge({
    this.id,
    this.key,
    this.value,
  });

  // Constructor for creating an instance from JSON.
  ProductBadge.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  ProductBadge.fromLocalJson(Map json) {
    try {
      // id = json['id'];
      key = json['key'];
      value = json['value'];
      print("json value is $value");
    } catch (e) {
      print("json error is $e");
      printLog(e.toString());
    }
  }

  // Converts the MetaDataItem to JSON format.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'value': value,
    };
  }
}

class ProductBadgeDetails {
  // int? id;
  String? image;
  // dynamic value; // The value can be a String, List, Map, etc.

  ProductBadgeDetails({
    this.image,
    // this.key,
    // this.value,
  });

  // Constructor for creating an instance from JSON.
  ProductBadgeDetails.fromJson(Map<String, dynamic> json) {
    image = json['image_url'];
    // key = json['key'];
    // value = json['value'];
  }

  ProductBadgeDetails.fromLocalJson(Map json) {
    try {
      // id = json['id'];
      // key = json['key'];
      image = json['image_url'];
    } catch (e) {
      printLog(e.toString());
    }
  }

  // Converts the MetaDataItem to JSON format.
  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      // 'key': key,
      'image_url': image,
    };
  }
}

// Class for handling the entire metadata structure, including nested elements.
// class MetaData {
//   List<ProductBadge> items = [];
//
//   MetaData({required this.items});
//
//   // Constructor to parse a JSON array and populate the list of MetaDataItem instances.
//   MetaData.fromJson(List<dynamic> jsonList) {
//     items = jsonList.map((json) => ProductBadge.fromJson(json)).toList();
//   }
//
//   // Converts the MetaData to JSON format.
//   Map<String, dynamic> toJson() {
//     return {
//       'meta_data': items.map((item) => item.toJson()).toList(),
//     };
//   }
// }

// Usage Example:
// Assuming `responseJson` is a parsed JSON map of the metadata.
void main() {
  // Replace this example list with actual parsed JSON response from API.
  List<dynamic> jsonResponse = [
    {
      "id": 11915,
      "key": "_wp_page_template",
      "value": "default"
    },
    // Additional entries would go here.
  ];

  // MetaData metaData = MetaData.fromJson(jsonResponse);

  // print(metaData.toJson()); // Prints out the JSON representation of the metadata.
}
