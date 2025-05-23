import 'dart:async';

import 'package:flutter/material.dart';

import '../models/cart/cart_model.dart';
import '../services/index.dart';
import 'entities/tax.dart';

class TaxModel extends ChangeNotifier {
  final Services _service = Services();
  List<Tax>? taxes = [];
  double taxesTotal = 0;
  bool isIncludingTax = false;
  bool _isLoadingTax = false;
  bool get isLoadingTax => _isLoadingTax;

  Future<void> getTaxes(CartModel cartModel, String? token, onSuccess,
      {Function? onError}) async {
    try {
      _isLoadingTax = true;
      notifyListeners();

      var res = await _service.api.getTaxes(cartModel, token);
      if (res != null) {
        taxes = res.items;
        taxesTotal = res.total ?? 0;
        isIncludingTax = res.isIncludingTax ?? false;
      }
      onSuccess(taxesTotal, taxes, isIncludingTax);
    } catch (err) {
      if (onError != null) {
        onError(err);
      }
    }
    _isLoadingTax = false;
    notifyListeners();
  }
}
