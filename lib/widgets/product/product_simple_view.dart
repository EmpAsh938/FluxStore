import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/tools.dart';
import '../../../generated/l10n.dart';
import '../../../models/index.dart' show AppModel, Product;
import '../../common/theme/colors.dart';
import '../../modules/dynamic_layout/config/product_config.dart';
import '../../services/index.dart';
import '../html/index.dart';
import 'action_button_mixin.dart';
import 'index.dart' show CartIcon, CartQuantity, ProductOnSale;

enum SimpleType { backgroundColor, priceOnTheRight }

class ProductSimpleView extends StatelessWidget with ActionButtonMixin {
  final Product? item;
  final SimpleType? type;
  final bool isFromSearchScreen;
  final bool enableBackgroundColor;
  final ProductConfig? config;

  const ProductSimpleView({
    this.item,
    this.type,
    this.isFromSearchScreen = false,
    this.enableBackgroundColor = true,
    this.config,
  });

  @override
  Widget build(BuildContext context) {
    if (item?.name == null) return const SizedBox();
    var productConfig = config ?? ProductConfig.empty();

    final appModel = Provider.of<AppModel>(context);
    final currency = appModel.currency;
    final currencyRate = appModel.currencyRate;
    var screenWidth = MediaQuery.of(context).size.width;
    var titleFontSize = 15.0;
    var imageWidth = 60.0;
    var imageHeight = 60.0;

    final theme = Theme.of(context);

    var isSale = (item!.onSale ?? false) &&
        PriceTools.getPriceProductValue(item, onSale: true) !=
            PriceTools.getPriceProductValue(item, onSale: false);
    if (item!.isVariableProduct) {
      isSale = item!.onSale ?? false;
    }

    var canAddToCart = !item!.isEmptyProduct() &&
        ((item?.inStock ?? false) || item!.backordersAllowed) &&
        item!.type != 'variable' &&
        item!.type != 'appointment' &&
        item!.type != 'booking' &&
        item!.type != 'external' &&
        item!.type != 'configurable' &&
        (item!.addOns?.isEmpty ?? true);
    String? imageUrl;

    if (item?.badgeData != null &&
        item!.badgeData.isNotEmpty &&
        item!.badgeData.first.value != null &&
        item!.badgeData.first.value!.isNotEmpty &&
        item!.badgeData.first.value!.first['image_url'] != null) {
      imageUrl = item!.badgeData.first.value!.first['image_url'];

      if (imageUrl != null && imageUrl.startsWith("http:http")) {
        imageUrl = imageUrl.replaceFirst("http:", "");
      }
    } else {
      imageUrl = ''; // Set a default value for items without an image.
    }

    /// Product Pricing
    Widget productPricing = Services().widget.hideProductPrice(context, item)
        ? const SizedBox()
        : Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            children: <Widget>[
              if (!(item?.isEmptyProduct() ?? true))
                Text(
                  item!.type == 'grouped'
                      ? '${S.of(context).from} ${PriceTools.getPriceProduct(item, currencyRate, currency, onSale: true)}'
                      : item!.isCompositeProduct == true
                          ? ""
                          : PriceTools.getPriceProduct(
                              item, currencyRate, currency,
                              onSale: true)!,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              if (isSale) ...[
                const SizedBox(width: 5),
                Text(
                  item!.type == 'grouped'
                      ? ''
                      : PriceTools.getPriceProduct(item, currencyRate, currency,
                          onSale: false)!,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
              ]
            ],
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: GestureDetector(
        onTap: () => onTapProduct(context,
            isFromSearchScreen: isFromSearchScreen,
            product: item!,
            config: config),
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            color: appModel.darkTheme ? Colors.black : Colors.white,
            border: Border.all(
              color: Colors.black12,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: CachedNetworkImage(
                        width: imageWidth,
                        height: imageHeight,
                        fit: BoxFit.cover,
                        imageUrl: item?.imageFeature ?? "",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Container(
                          height: imageHeight,
                          width: imageWidth,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    ProductOnSale(
                      product: item!,
                      config: productConfig,
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      margin: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HtmlWidget(
                                  item!.name!,
                                  textStyle: TextStyle(
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                HtmlWidget(
                                  item!.shortDescription!,
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (item!.verified ?? false)
                            Icon(
                              Icons.verified_user,
                              size: 18,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                        ],
                      ),
                      if (type != SimpleType.priceOnTheRight)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  item!.isCompositeProduct == true
                                      ? const SizedBox()
                                      : const Text(
                                          'Starting at',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                  productPricing,
                                ],
                              ),
                            ),
                            const Spacer(),
                            if (productConfig.showQuantity)
                              SizedBox(
                                width: productConfig.showCartIcon ? 200 : 140,
                                child: CartQuantity(
                                  product: item!,
                                  config: productConfig,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
                if (type == SimpleType.priceOnTheRight)
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: [
                        item!.isCompositeProduct == true
                            ? const SizedBox()
                            : const Text(
                                'Starting at',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                        productPricing
                      ],
                    ),
                  ),
                if ((kProductDetail.showAddToCartInSearchResult &&
                    canAddToCart &&
                    !productConfig.showQuantity))
                  // CartIcon(
                  //   product: item!,
                  //   config: productConfig,
                  // ),
                  if (imageUrl != null && imageUrl.isNotEmpty)
                    ImageResize(
                      url: imageUrl,
                      width: 30,
                      size: kSize.medium,
                      isResize: true,
                      // fit: ImageTools.boxFit(config.imageBoxfit),
                      offset: 0.0,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
