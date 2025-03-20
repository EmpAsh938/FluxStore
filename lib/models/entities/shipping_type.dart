import 'package:collection/collection.dart';

import '../../generated/l10n.dart';

enum ShippingType { pickup, delivery }

extension ShippingTypeX on ShippingType {
  String get displayName {
    switch (this) {
      case ShippingType.pickup:
        return S.current.pickup;
      case ShippingType.delivery:
        return S.current.delivery;
    }
  }

  String get rawValue {
    switch (this) {
      case ShippingType.pickup:
        return 'pick-up';
      case ShippingType.delivery:
        return 'delivery';
    }
  }

  static ShippingType? initFrom(String? value) {
    return ShippingType.values.firstWhereOrNull(
        (ShippingType e) => e.rawValue.toLowerCase() == value?.toLowerCase());
  }
}
