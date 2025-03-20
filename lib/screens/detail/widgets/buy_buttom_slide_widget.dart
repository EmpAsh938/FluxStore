import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../frameworks/frameworks.dart';
import '../../../models/entities/index.dart';
import '../../../models/product_model.dart';
import '../../../models/product_variant_model.dart';
import '../../../services/service_config.dart';
import '../../../services/services.dart';

class BuyButtonSlideWidget extends StatelessWidget {
  const BuyButtonSlideWidget({
    super.key,
    this.showQuantity = true,
    this.useHorizontalLayout = false,
  });

  final bool showQuantity;
  final bool useHorizontalLayout;

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProductVariantModel>(context);
    var productVariation = model.productVariation;
    var product = model.product ?? Product();
    var mapAttribute = model.mapAttribute;
    var quantity = model.quantity;
    var variations =
        context.select((ProductModel productModel) => productModel.variations);
    var isInAppPurchaseChecking = model.isInAppPurchaseChecking;

    return SizedBox(
      height: 85,
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: Services().widget.getBuyButtonWidget(
              context: context,
              productVariation: productVariation,
              product: product,
              mapAttribute: mapAttribute,
              useHorizontalLayout: useHorizontalLayout,
              maxQuantity: _getMaxQuantity(product, productVariation),
              quantity: quantity,
              addToCart: ({bool buyNow = false, bool inStock = false}) {
                _addToCart(context, buyNow, inStock);
              },
              onChangeQuantity: (val) {
                model.updateValues(quantity: val);
              },
              variations: variations,
              isInAppPurchaseChecking: isInAppPurchaseChecking,
              showQuantity: true,
            ),
      ),
    );
  }

  /// check limit select quality by maximum available stock
  int _getMaxQuantity(Product product, ProductVariation? productVariation) {
    var limitSelectQuantity = kCartDetail['maxAllowQuantity'] ?? 100;

    /// Skip check stock quantity for backorder products.
    if (product.backordersAllowed) {
      return limitSelectQuantity;
    }

    if (productVariation != null) {
      if (productVariation.stockQuantity != null &&
          kCartDetail['maxAllowQuantity'] != null) {
        limitSelectQuantity = math.min<int>(
            productVariation.stockQuantity!, kCartDetail['maxAllowQuantity']);
      }
    } else if (product.stockQuantity != null &&
        kCartDetail['maxAllowQuantity'] != null) {
      limitSelectQuantity = math.min<int>(
          product.stockQuantity!, kCartDetail['maxAllowQuantity']);
    }
    return limitSelectQuantity;
  }

  /// Add to Cart & Buy Now function
  void _addToCart(BuildContext context,
      [bool buyNow = false, bool inStock = false]) {
    var model = Provider.of<ProductVariantModel>(context, listen: false);
    var productVariation = model.productVariation;
    var product = model.product ?? Product();
    var mapAttribute = model.mapAttribute;
    var quantity = model.quantity;
    var selectedComponents = model.selectedComponents;

    if (buyNow &&
        Services().widget.enableInAppPurchase &&
        !ServerConfig().isBuilder) {
      Services().doIAPPayment(
          context, product, productVariation, quantity, mapAttribute ?? {},
          (bool isLoading) {
        model.updateValues(isInAppPurchaseChecking: isLoading);
      }, () {
        Services().widget.addToCart(
            context,
            product,
            quantity,
            AddToCartArgs(
              productVariation: productVariation,
              mapAttribute: mapAttribute ?? {},
              selectedComponents: selectedComponents,
            ),
            buyNow,
            inStock);
      });
    } else {
      Services().widget.addToCart(
          context,
          product,
          quantity,
          AddToCartArgs(
            productVariation: productVariation,
            mapAttribute: mapAttribute ?? {},
            selectedComponents: selectedComponents,
          ),
          buyNow,
          inStock);
    }
  }
}
