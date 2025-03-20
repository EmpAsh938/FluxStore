import 'package:flutter/material.dart';

import '../../../models/entities/product.dart';
import '../../../services/base_services.dart';

enum ProductListCustomState {
  none,
  loading;

  bool get isLoading => this == ProductListCustomState.loading;
}

class ProductListCustomModel extends ChangeNotifier {
  final BaseServices api;
  final List<Product> listProducts = [];
  var _state = ProductListCustomState.none;

  ProductListCustomState get state => _state;

  ProductListCustomModel({required this.api});

  Future<void> fetchListProduct(List<String>? productIds) async {
    if (productIds?.isEmpty ?? true) {
      return;
    }

    _updateState(ProductListCustomState.loading);

    final list = await api.getProductsByIds(productIds!);
    listProducts.clear();
    listProducts.addAll(list ?? []);

    _updateState(ProductListCustomState.none);
  }

  void _updateState(ProductListCustomState state) {
    _state = state;
    notifyListeners();
  }
}
