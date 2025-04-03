import 'package:flutter/material.dart';

import '../../../../common/config.dart';
import '../../../../common/theme/colors.dart';
import '../../../../common/tools.dart';
import '../../../../generated/l10n.dart';
import '../../../../services/index.dart';
import '../../quantity_selection/quantity_selection.dart';
import '../cart_item_state_ui.dart';

class CartItemNormalWidget extends StatelessWidget {
  const CartItemNormalWidget(
    this.stateUI, {
    super.key,
    this.widthImageFeature = 100,
    this.heightImageFeature = 100,
  });

  final CartItemStateUI stateUI;

  final double widthImageFeature;
  final double heightImageFeature;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var totalPrice = 0.0;

    if (stateUI.cartItemMetaData?.selectedComponents != null) {
      for (var item in stateUI.cartItemMetaData!.selectedComponents!.values) {
        final quantity = item.quantity ?? 0;
        final subTotal = item.product.price ?? '0.0';

        totalPrice += quantity * (double.tryParse(subTotal) ?? 0.0);
      }
    }

    var priceFromState = stateUI.price?.split('\$').last ?? '0.0';
    totalPrice = (double.tryParse(priceFromState) == 0.0)
        ? totalPrice
        : double.parse(priceFromState);

    print("CARTCOMPOENENNT ${stateUI.product.toJson()}");

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        children: [
          if (stateUI.enableTopDivider == true)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(color: kGrey200, height: 1),
            ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              key: ValueKey(stateUI.product.id),
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (stateUI.onRemove != null)
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: stateUI.onRemove,
                  ),
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        stateUI.onTapProduct(context, product: stateUI.product),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width:
                              widthImageFeature, //constraints.maxWidth * 0.25,
                          height:
                              heightImageFeature, //constraints.maxWidth * 0.3,
                          child: ImageResize(url: stateUI.imageFeature ?? ''),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stateUI.product.name ?? '',
                                  style: TextStyle(
                                    color: theme.colorScheme.secondary,
                                  ),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 7),
                                if (stateUI.showPrice(context) &&
                                    totalPrice > 0.0)
                                  Text(
                                    // stateUI.priceWithQuantity!,
                                    '\$${totalPrice.toString()}',
                                    style: TextStyle(
                                        color: theme.colorScheme.secondary,
                                        fontSize: 14),
                                  ),
                                const SizedBox(height: 10),
                                if (stateUI.product.options != null &&
                                    stateUI.cartItemMetaData?.options != null)
                                  Services().widget.renderOptionsCartItem(
                                      stateUI.product,
                                      stateUI.cartItemMetaData?.options),
                                if (stateUI.cartItemMetaData?.variation != null)
                                  Services().widget.renderVariantCartItem(
                                      context,
                                      stateUI.cartItemMetaData!.variation!,
                                      stateUI.cartItemMetaData?.options),
                                if (stateUI.cartItemMetaData?.addonsOptions
                                        ?.isNotEmpty ??
                                    false)
                                  Services().widget.renderAddonsOptionsCartItem(
                                      context,
                                      stateUI.cartItemMetaData?.addonsOptions),
                                if (stateUI.cartItemMetaData?.selectedComponents
                                        ?.isNotEmpty ??
                                    false)
                                  Services()
                                      .widget
                                      .renderSelectedComponentsCartItem(
                                          context,
                                          stateUI.cartItemMetaData
                                              ?.selectedComponents),
                                if (stateUI.isPWGiftCardProduct)
                                  Services()
                                      .widget
                                      .renderPWGiftCardInfoCartItem(
                                        stateUI
                                            .cartItemMetaData?.pwGiftCardInfo,
                                        quantity: stateUI.quantity,
                                        price: stateUI
                                            .cartItemMetaData?.variation?.price,
                                      ),
                                if (stateUI.showQuantity)
                                  QuantitySelection(
                                    enabled: stateUI.inStock &&
                                        stateUI.onChangeQuantity != null,
                                    width: 60,
                                    height: 32,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    limitSelectQuantity: stateUI.isOnBackorder
                                        ? kCartDetail['maxAllowQuantity']
                                        : stateUI.limitQuantity,
                                    value: stateUI.quantity,
                                    onChanged: stateUI.onChangeQuantity,
                                    style: QuantitySelectionStyle.normal,
                                    isComposite:
                                        stateUI.product.isCompositeProduct,
                                  ),
                                if (stateUI.product.store != null &&
                                    (stateUI.product.store?.name != null &&
                                        stateUI.product.store!.name!
                                            .trim()
                                            .isNotEmpty))
                                  const SizedBox(height: 10),
                                if (!stateUI.inStock || stateUI.isOnBackorder)
                                  const SizedBox(height: 5),
                                if (stateUI.isOnBackorder)
                                  Text(S.of(context).backOrder,
                                      style: TextStyle(
                                        color: kStockColor.backorder,
                                      )),
                                if (!stateUI.isOnBackorder && !stateUI.inStock)
                                  Text(
                                    S.of(context).outOfStock,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                if (!stateUI.isOnBackorder &&
                                    stateUI.inStock &&
                                    stateUI.quantity != null &&
                                    stateUI.quantity! > stateUI.limitQuantity)
                                  Text(
                                    S.of(context).quantityProductExceedInStock,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                if (stateUI.showStoreName)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      stateUI.product.store?.name ?? '',
                                      style: TextStyle(
                                          color: theme.colorScheme.secondary,
                                          fontSize: 12),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
              ],
            ),
          ),
          if (stateUI.enableBottomDivider == true)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(color: kGrey200, height: 1),
            ),
        ],
      ),
    );
  }
}
