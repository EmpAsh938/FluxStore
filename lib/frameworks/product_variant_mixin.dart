import 'dart:async';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/config.dart';
import '../common/constants.dart';
import '../common/tools/flash.dart';
import '../common/tools/tools.dart';
import '../generated/l10n.dart';
import '../models/cart/cart_item_meta_data.dart';
import '../models/entities/product_component.dart';
import '../models/index.dart'
    show CartModel, Product, ProductModel, ProductVariation;
import '../models/product_variant_model.dart';
import '../modules/analytics/analytics.dart';
import '../modules/dynamic_layout/helper/helper.dart';
import '../routes/flux_navigate.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/detail/widgets/index.dart' show ProductShortDescription;
import '../services/services.dart';
import '../widgets/common/webview.dart';
import '../widgets/product/dialog_add_to_cart.dart';
import '../widgets/product/quantity_selection/quantity_selection.dart';
import 'frameworks.dart';

mixin ProductVariantMixin on BaseFrameworks {
  ProductVariation? updateVariation(
    List<ProductVariation> variations,
    Map<String?, String?> mapAttribute,
  ) {
    final templateVariation =
        variations.isNotEmpty ? variations.first.attributes : null;
    final listAttributes = variations.map((e) => e.attributes).toList();

    ProductVariation productVariation;
    var attributeString = '';

    /// Flat attribute
    /// Example attribute = { "color": "RED", "SIZE" : "S", "Height": "Short" }
    /// => "colorRedsizeSHeightShort"
    templateVariation?.forEach((element) {
      final key = element.keyAtrr;
      final value = mapAttribute[key];
      attributeString += value != null ? '$key$value' : '';
    });

    /// Find attributeS contain attribute selected
    final validAttribute = listAttributes.lastWhereOrNull(
      (attributes) {
        final valueCheck = attributes.map((e) => e.toStringCompare()).join();

        return attributeString.contains(valueCheck);
      },
    );

    if (validAttribute == null) return null;

    /// Find ProductVariation contain attribute selected
    /// Compare address because use reference
    productVariation =
        variations.lastWhere((element) => element.attributes == validAttribute);

    for (var element in productVariation.attributes) {
      if (!mapAttribute.containsKey(element.keyAtrr)) {
        mapAttribute[element.keyAtrr] = element.option!;
      }
    }
    return productVariation;
  }

  // Map<String, SelectedProductComponent>? get selectedComponents =>
  //     model.selectedComponents;
  bool isPurchased(
    ProductVariation? productVariation,
    Product product,
    Map<String?, String?>? mapAttribute,
    bool isAvailable,
  ) {
    var inStock = product.checkInStock(productVariation);

    var allowBackorder = productVariation != null
        ? (productVariation.backordersAllowed ?? false)
        : product.backordersAllowed;

    var isValidAttribute = false;
    if (!product.isVariableProduct) {
      isValidAttribute = true;
    } else if (product.attributes?.length == mapAttribute?.length) {
      isValidAttribute = true;
    }

    return (inStock || allowBackorder) && isValidAttribute && isAvailable;
  }

  List<Widget> makeProductTitleWidget(BuildContext context,
      ProductVariation? productVariation, Product product, bool isAvailable) {
    var listWidget = <Widget>[];
    final isCompositeProduct = product.isCompositeProduct;

    var inStock = product.checkInStock(productVariation);

    var stockQuantity = '';
    if (kProductDetail.showStockQuantity) {
      if (product.stockQuantity != null) {
        stockQuantity = '  (${product.stockQuantity}) ';
      }
      final selectedVariation = context.read<ProductModel>().selectedVariation;
      if (selectedVariation != null) {
        stockQuantity = selectedVariation.stockQuantity != null
            ? '  (${selectedVariation.stockQuantity}) '
            : '';
      }
    }

    if (isAvailable) {
      if (isCompositeProduct == false) {
        listWidget.add(
          const SizedBox(height: 5.0),
        );

        final sku =
            productVariation != null ? productVariation.sku : product.sku;

        listWidget.add(
          Row(
            children: <Widget>[
              if ((kProductDetail.showSku) && (sku?.isNotEmpty ?? false)) ...[
                Text(
                  '${S.of(context).sku}: ',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  sku ?? '',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: inStock
                            ? Theme.of(context).primaryColor
                            : const Color(0xFFe74c3c),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ],
          ),
        );

        listWidget.add(
          const SizedBox(height: 5.0),
        );

        listWidget.add(
          Row(
            children: <Widget>[
              if (kProductDetail.showStockStatus) ...[
                Text(
                  '${S.of(context).availability}: ',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                (productVariation != null
                        ? (productVariation.backordersAllowed ?? false)
                        : product.backordersAllowed)
                    ? Text(
                        S.of(context).backOrder,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: kStockColor.backorder,
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    : Text(
                        inStock
                            ? '${S.of(context).inStock}$stockQuantity'
                            : S.of(context).outOfStock,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: inStock
                                  ? kStockColor.inStock
                                  : kStockColor.outOfStock,
                              fontWeight: FontWeight.w600,
                            ),
                      )
              ],
            ],
          ),
        );
        if (productVariation?.description?.isNotEmpty ?? false) {
          listWidget.add(Services().widget.renderProductDescription(
              context, productVariation!.description!));
        }
      }

      if (product.shortDescription != null &&
          product.shortDescription!.isNotEmpty) {
        listWidget.add(
          ProductShortDescription(product),
        );
      }

      listWidget.add(
        const SizedBox(height: 15.0),
      );
    }

    return listWidget;
  }

  List<Widget> makeBuyButtonWidget({
    required BuildContext context,
    ProductVariation? productVariation,
    required Product product,
    Map<String?, String?>? mapAttribute,
    required int maxQuantity,
    required int quantity,
    required Function({bool buyNow, bool inStock}) addToCart,
    required Function(int quantity) onChangeQuantity,
    required bool isAvailable,
    bool useHorizontalLayout = false,
    required bool isInAppPurchaseChecking,
    bool showQuantity = true,
    Widget Function(bool Function(int) onChanged, int maxQuantity)?
        builderQuantitySelection,
    bool ignoreBuyOrOutOfStockButton = false,
  }) {
    final theme = Theme.of(context);

    final inStock = product.checkInStock(productVariation);

    final allowBackorder = productVariation != null
        ? (productVariation.backordersAllowed ?? false)
        : product.backordersAllowed;

    final allowToBuy = inStock || allowBackorder;

    // External products always only display the buy now button
    final isExternal = product.type == 'external' ? true : false;

    final isVariationLoading = product.isVariableProduct &&
        productVariation == null &&
        mapAttribute == null;

    var backgroundColor = theme.primaryColor;

    // If [alwaysShowBuyButton] is true, the buy now button is always displayed
    // instead of buy or out of stock
    final alwaysShowBuyButton = kProductDetail.alwaysShowBuyButton;

    var text = S.of(context).unavailable;

    if (isVariationLoading) {
      text = S.of(context).loading;
    } else if (isInAppPurchaseChecking) {
      text = S.of(context).checking;
    } else if (isExternal ||
        alwaysShowBuyButton ||
        (allowToBuy && isAvailable)) {
      text = S.of(context).buyNow;
    } else if (!allowToBuy) {
      text = S.of(context).outOfStock;
    }

    final buyOrOutOfStockButton = Container(
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: backgroundColor.getColorBasedOnBackground,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );

    final files = product.files ?? [];
    if ((product.isPurchased) &&
        (product.isDownloadable ?? false) &&
        files.isNotEmpty &&
        (files.first?.isNotEmpty ?? false)) {
      return [
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () async => await Tools.launchURL(files.first,
                    mode: LaunchMode.externalApplication),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                      child: Text(
                    S.of(context).download,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                        ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ];
    }

    return [
      // if (useHorizontalLayout)
      //   Expanded(
      //     flex: 2,
      //     child: Container(
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(3),
      //       ),
      //       child: Center(
      //         child: Container(
      //           decoration: BoxDecoration(
      //             color: kGrey200,
      //             borderRadius: BorderRadius.circular(30),
      //           ),
      //           child: QuantitySelection(
      //             height: 27,
      //             expanded: false,
      //             value: quantity,
      //             color: theme.colorScheme.secondary,
      //             colorButtonAdd: theme.primaryColor,
      //             colorButtonSub: Colors.grey[350],
      //             limitSelectQuantity: maxQuantity,
      //             style: QuantitySelectionStyle.style02,
      //             onChanged: (p0) {
      //               final result = onChangeQuantity(p0);
      //               return result ?? true;
      //             },
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // else if (!isExternal && showQuantity) ...[
      // if (builderQuantitySelection != null)
      //   builderQuantitySelection((p0) => onChangeQuantity(p0), maxQuantity)
      // else ...[
      //   const SizedBox(height: 10),
      //   Row(
      //     children: [
      //       Expanded(
      //         child: Text(
      //           '${S.of(context).selectTheQuantity}:',
      //           style: Theme.of(context).textTheme.titleMedium,
      //         ),
      //       ),
      //       Expanded(
      //         child: Container(
      //           height: 25,
      //           alignment: Alignment.center,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(3),
      //           ),
      //           child: QuantitySelection(
      //             height: 25,
      //             expanded: true,
      //             value: quantity,
      //             color: theme.colorScheme.secondary,
      //             limitSelectQuantity: maxQuantity,
      //             style: QuantitySelectionStyle.style01,
      //             onChanged: (p0) {
      //               final result = onChangeQuantity(p0);
      //               return result ?? true;
      //             },
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ],
      // ],
      // const SizedBox(height: 10),

      /// Action Buttons: Buy Now, Add To Cart
      Expanded(
        flex: 1,
        child: Center(
          child: actionButton(
            ignoreBuyOrOutOfStockButton,
            isAvailable,
            addToCart,
            inStock,
            allowBackorder,
            buyOrOutOfStockButton,
            isExternal,
            isVariationLoading,
            isInAppPurchaseChecking,
            context,
            useHorizontalLayout,
            quantity,
            maxQuantity,
            onChangeQuantity,
            product,
          ),
        ),
      )
    ];
  }

  /// Add to Cart & Buy Now function
  @override
  void addToCart(
      BuildContext context, Product product, int quantity, AddToCartArgs? args,
      [bool buyNow = false, bool inStock = false, bool inBackground = false]) {
    final cartModel = Provider.of<CartModel>(context, listen: false);
    if (product.type == 'external') {
      openExternal(context, product);
      return;
    }

    // Out of stock
    if (!inStock) {
      FlashHelper.errorMessage(context,
          message: S.of(context).productOutOfStock);
      return;
    }

    // Variable product but not select all variants.
    if (product.isVariableProduct &&
        product.attributes?.length != args?.mapAttribute?.length) {
      FlashHelper.errorMessage(
        context,
        message: S.of(context).pleaseSelectAllAttributes,
      );
      return;
    }

    final mapAttr = <String, String>{};
    for (var entry in (args?.mapAttribute ?? {}).entries) {
      final key = entry.key;
      final value = entry.value;
      if (key != null && value != null) {
        mapAttr[key] = value;
      }
    }

    var productVariation =
        Provider.of<ProductModel>(context, listen: false).selectedVariation;
    var message = cartModel.addProductToCart(
        context: context,
        product: product,
        quantity: quantity,
        cartItemMetaData: CartItemMetaData(
          variation: productVariation,
          options: mapAttr,
          selectedComponents: args?.selectedComponents,
          selectedTiredPrice: args?.selectedTiredPrice,
          tiredPrices: args?.tiredPrices,
          pwGiftCardInfo: args?.pwGiftCardInfo,
        ));

    if (message.isNotEmpty) {
      FlashHelper.errorMessage(
        context,
        message: message,
      );
    } else {
      Analytics.triggerAddToCart(product, quantity, context);
      if (buyNow) {
        FluxNavigate.pushNamed(
          RouteList.cart,
          context: context,
          arguments: CartScreenArgument(isModal: true, isBuyNow: true),
        );
      }
      // CartDialog.show(
      //     context,
      //     product: product,);
      FlashHelper.message(
        context,
        // message: """product.name != null
        //     ? S.of(context).productAddToCart(product.name!)
        //     : S.of(context).addToCartSuccessfully""",
        message: product.name != null
            ? S.of(context).productAddToCart(product.name!)
            : S.of(context).addToCartSuccessfully,
        messageStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      );
    }
  }

  /// Support Affiliate product
  @override
  Future<void> openExternal(BuildContext context, Product product) async {
    final url = Tools.prepareURL(product.affiliateUrl);

    if (url != null) {
      try {
        if (kIsWeb ||
            Layout.isDisplayDesktop(context) ||
            Tools.needToOpenExternalApp(url)) {
          await Tools.launchURL(url);
        } else {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebView(
                url: product.affiliateUrl,
                title: product.name,
              ),
            ),
          );
        }
        return;
      } catch (e) {
        printError(e);
      }
    }
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Center(
          child: Text(S.of(context).notFound),
        ),
      );
    }));
  }
}

Widget actionButton(
  bool ignoreBuyOrOutOfStockButton,
  bool isAvailable,
  Function addToCart,
  bool inStock,
  bool allowBackorder,
  Widget buyOrOutOfStockButton,
  bool isExternal,
  bool isVariationLoading,
  bool isInAppPurchaseChecking,
  BuildContext context,
  bool useHorizontalLayout,
  int quantity,
  int maxQuantity,
  Function(int quantity) onChangeQuantity,
  Product product,
) {
  return LayoutBuilder(builder: (_, constraints) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // if (!ignoreBuyOrOutOfStockButton && !useHorizontalLayout)
        //   Expanded(
        //     child: GestureDetector(
        //       onTap: (isAvailable && !isInAppPurchaseChecking)
        //           ? () => addToCart(true, inStock || allowBackorder)
        //           : null,
        //       child: buyOrOutOfStockButton,
        //     ),
        //   ),
        // if (!ignoreBuyOrOutOfStockButton && !useHorizontalLayout)
        //   const SizedBox(width: 10),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: kGrey200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: QuantitySelection(
                height: 30,
                expanded: false,
                value: quantity,
                color: theme.colorScheme.secondary,
                colorButtonAdd: theme.primaryColor,
                colorButtonSub: Colors.grey[350],
                limitSelectQuantity: maxQuantity,
                style: QuantitySelectionStyle.style04,
                onChanged: (p0) {
                  final result = onChangeQuantity(p0);
                  return result ?? true;
                },
              ),
            ),
          ),
        ),
        Container(
          width: 10,
        ),
        if (isAvailable &&
            (inStock || allowBackorder) &&
            !isExternal &&
            !isVariationLoading &&
            !useHorizontalLayout)
          Expanded(
            child: Consumer<ProductVariantModel>(
                builder: (_, productVariantModel, ___) {
              return GestureDetector(
                onTap: () => addToCart(
                    buyNow: false, inStock: inStock || allowBackorder),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color:
                    // product.name == 'Fresh Start Orange 525ml' ||
                    //         product.name == 'Soup Bowl' ||
                    //         product.name == 'Snakkas' ||
                    //         product.name == 'Snakkas' ||
                            productVariantModel.selectedComponents != null &&
                                productVariantModel
                                    .selectedComponents!.isNotEmpty
                        ? Theme.of(context).primaryColor
                        : Colors.grey[350],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).addToCart.toUpperCase(),
                        style: const TextStyle(
                          // color: Theme.of(context).colorScheme.secondary,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '\$ ${productVariantModel.totalPrice}',
                        style: const TextStyle(
                          // color: Theme.of(context).colorScheme.secondary,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          )
        // else if (useHorizontalLayout)
        //   GestureDetector(
        //     behavior: HitTestBehavior.translucent,
        //     onTap: () =>
        //         addToCart(buyNow: true, inStock: inStock || allowBackorder),
        //     child: SizedBox(
        //       width: constraints.maxWidth,
        //       child: Align(
        //         alignment: AlignmentDirectional.centerEnd,
        //         child: Container(
        //           margin: const EdgeInsetsDirectional.only(start: 16),
        //           decoration: BoxDecoration(
        //             color: Theme.of(context).primaryColor,
        //             borderRadius: BorderRadius.circular(40),
        //           ),
        //           padding: const EdgeInsets.all(6),
        //           child: Row(
        //             mainAxisSize: MainAxisSize.min,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(
        //                   horizontal: 8.0,
        //                   vertical: 3,
        //                 ),
        //                 child: Column(
        //                   mainAxisSize: MainAxisSize.min,
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       'Total price',
        //                       style: TextStyle(
        //                         color: Theme.of(context)
        //                             .primaryColor
        //                             .getColorBasedOnBackground,
        //                         fontSize: 12,
        //                       ),
        //                     ),
        //                     Consumer<ProductVariantModel>(
        //                       builder: (_, productVariantModel, ___) {
        //                         return Text(
        //                           '\$ ${productVariantModel.totalPrice}',
        //                           style: TextStyle(
        //                             color: Theme.of(context)
        //                                 .primaryColor
        //                                 .getColorBasedOnBackground,
        //                             fontSize: 22,
        //                             fontWeight: FontWeight.w900,
        //                           ),
        //                         );
        //                       },
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               const SizedBox(width: 5),
        //               Container(
        //                 width: 45,
        //                 decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.circular(20),
        //                 ),
        //                 padding: const EdgeInsets.all(8),
        //                 child: Icon(
        //                   CupertinoIcons.cart,
        //                   color: Theme.of(context).primaryColor,
        //                   size: 18,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
      ],
    );
  });
}
