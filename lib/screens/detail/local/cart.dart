import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/cart/cart_item_meta_data.dart';

class SharedCartItems {
  /// Save a single cart item to SharedPreferences
  Future<void> saveCart(CartItemMetaData cartItem) async {
    final prefs = await SharedPreferences.getInstance();
    String cartJson = jsonEncode(cartItem.toJson());
    await prefs.setString('cart_data', cartJson);
  }

  /// Load a single cart item from SharedPreferences
  Future<CartItemMetaData?> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    String? cartJson = prefs.getString('cart_data');

    if (cartJson != null) {
      Map<String, dynamic> cartMap = jsonDecode(cartJson);
      return CartItemMetaData.fromLocalJson(cartMap);
    }

    return null; // Return null if no data is found
  }
}
