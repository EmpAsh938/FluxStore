import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/theme/colors.dart';
import '../../../common/tools/image_resize.dart';
import '../../../common/tools/image_tools.dart';
import '../../../common/tools/price_tools.dart';
import '../../../generated/l10n.dart';
import '../../../models/app_model.dart';
import '../../../models/entities/product.dart';
import '../../../models/entities/product_attribute.dart';
import '../../../models/entities/product_component.dart';
import '../../../models/entities/product_variation.dart';
import '../../../modules/dynamic_layout/config/index.dart';
import '../../../services/index.dart';
import '../../../widgets/product/quantity_selection/quantity_selection.dart';
import '../../../widgets/product/widgets/image.dart';
import '../../../widgets/product/widgets/pricing.dart';

class ProductComponentItem extends StatefulWidget {
  const ProductComponentItem({
    super.key,
    required this.product,
    required this.onSelected,
    required this.onChanged,
    this.selectedComponent,
    required this.cpPerItemPricing,
    this.isSelected = false,
  });

  final Product product;
  final Function(ProductVariation? variant) onSelected;
  final Function(SelectedProductComponent) onChanged;
  final SelectedProductComponent? selectedComponent;
  final bool isSelected;
  final bool cpPerItemPricing;

  @override
  State<ProductComponentItem> createState() => _ProductComponentItemState();
}

class _ProductComponentItemState extends State<ProductComponentItem> {
  var _mapAttrs = <String?, String?>{};
  List<ProductVariation>? _variations;
  bool _loading = false;

  void _updateMapAttrs(ProductVariation? variant) {
    for (var attribute in variant?.attributes ?? []) {
      _mapAttrs.update(attribute.name, (value) => value, ifAbsent: () {
        return attribute.option;
      });
    }
  }

  @override
  void didUpdateWidget(covariant ProductComponentItem oldWidget) {
    var currentSelected = widget.selectedComponent != null &&
        widget.selectedComponent?.product.id == widget.product.id;
    var oldSelected = oldWidget.selectedComponent != null &&
        oldWidget.selectedComponent?.product.id == oldWidget.product.id;
    if (currentSelected != oldSelected &&
        currentSelected == true &&
        widget.product.isVariableProduct &&
        (_variations?.isEmpty ?? true)) {
      setState(() {
        _loading = true;
      });
      Services().api.getProductVariations(widget.product)!.then((value) {
        setState(() {
          _loading = false;
          _variations = value!.toList();
        });

        if (_variations?.isNotEmpty ?? false) {
          _updateMapAttrs(_variations?.first);
          widget.onChanged(
              widget.selectedComponent!.copyWith(variant: _variations?.first));
        }
      }).catchError((_) {
        setState(() {
          _loading = false;
        });
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<AppModel>(context, listen: false).langCode;
    final currency = Provider.of<AppModel>(context, listen: false).currencyCode;
    final currencyRate = Provider.of<AppModel>(context).currencyRate;

    var selected = widget.selectedComponent != null &&
        widget.selectedComponent?.product.id == widget.product.id;
    final showSelection =
        selected && (widget.selectedComponent?.component.maxQuantity ?? 0) > 1;

    var variant = selected ? widget.selectedComponent?.variant : null;
    if (variant == null && (_variations?.isNotEmpty ?? false)) {
      variant = _variations?.first;
      _updateMapAttrs(_variations?.first);
    }
    var inStock = widget.product.inStock ?? false;
    var hidePrice = !widget.cpPerItemPricing;
    String? imageUrl;

// Check if badgeData exists and is not empty
    if (widget.product.badgeData.isNotEmpty &&
        widget.product.badgeData.first.value != null &&
        widget.product.badgeData.first.value!.isNotEmpty) {
      // Extract image URL safely
      imageUrl = widget.product.badgeData.first.value!.first['image_url'];

      // Handle invalid URLs (starting with "http:http")
      if (imageUrl != null && imageUrl.startsWith("http:http")) {
        imageUrl = imageUrl.replaceFirst("http:", "");
      }
    } else {
      // Set imageUrl to an empty string if badgeData is missing or invalid
      imageUrl = '';
    }

    // String? imageUrl;
    // if (widget.product.badgeData.first.value != null) {
    //   if (widget.product.badgeData.first.value!.first.toString().isNotEmpty) {
    //     print(
    //         "widget.product.badgeData.first.value ${widget.product.badgeData.first.value!.first['image_url']}");
    //     imageUrl = widget.product.badgeData.first.value!.first['image_url'];
    //
    //     if (imageUrl != null && imageUrl.startsWith("http:http")) {
    //       imageUrl = imageUrl.replaceFirst("http:", "");
    //     }
    //   }
    //   else{
    //     imageUrl = '';
    //   }
    // }

    return GestureDetector(
      onTap: inStock
          ? () {
              widget.onSelected(variant);
            }
          : null,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      width: 100,
                      height: 100,
                      imageUrl: widget.product.imageFeature.toString(),
                      placeholder: (context, url) => const SizedBox(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.name ?? '',
                              style: selected
                                  ? Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor)
                                  : Theme.of(context).textTheme.titleSmall),
                          const SizedBox(height: 5),
                          if ((variant == null && !hidePrice) ||
                              (widget.selectedComponent?.variant == null &&
                                  (double.tryParse(
                                              widget.product.price ?? '0') ??
                                          0) !=
                                      0.0))
                            ProductPricing(
                              product: widget.product,
                              hide: false,
                            ),
                          if (widget.selectedComponent?.variant != null ||
                              (variant != null && !hidePrice))
                            Text(
                              PriceTools.getCurrencyFormatted(
                                  widget.selectedComponent?.variant?.price,
                                  currencyRate,
                                  currency: currency)!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.6),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                            ),
                          if (!inStock)
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                S.of(context).outOfStock,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.red),
                              ),
                            )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (showSelection)
                          QuantitySelection(
                            enabled: true,
                            width: 25,
                            height: 25,
                            quantityStep: 1,
                            enabledTextBox: true,
                            color: Theme.of(context).colorScheme.secondary,
                            limitSelectQuantity: widget
                                    .selectedComponent?.component.maxQuantity ??
                                0,
                            value: widget.selectedComponent?.quantity ?? 0,
                            onChanged: (value) {
                              widget.onChanged(widget.selectedComponent!
                                  .copyWith(quantity: value));
                              return true;
                            },
                            style: QuantitySelectionStyle.style02,
                          ),
                        if (showSelection && widget.isSelected)
                          const SizedBox(height: 45),
                        if (widget.isSelected) const Icon(Icons.close),
                      ],
                    ),
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
                if (selected && _loading)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: kLoadingWidget(context),
                  ),
                if (selected &&
                    widget.product.isVariableProduct &&
                    (_variations?.isNotEmpty ?? false))
                  ...Services().widget.getProductAttributeWidget(
                      lang, widget.product, _mapAttrs, ({
                    ProductAttribute? attr,
                    String? val,
                    List<ProductVariation>? variations,
                    Map<String?, String?>? mapAttribute,
                    Function? onFinish,
                  }) {
                    Services().widget.onSelectProductVariant(
                          attr: attr!,
                          val: val,
                          variations: variations!,
                          mapAttribute: mapAttribute!,
                          onFinish: (Map<String?, String?> mapAttribute,
                              ProductVariation? variation) {
                            setState(() {
                              _mapAttrs = mapAttribute;
                            });
                            if (variation != null) {
                              widget.onChanged(widget.selectedComponent!
                                  .copyWith(variant: variation));
                            } else {
                              widget.onChanged(
                                  widget.selectedComponent!.removeVariant());
                            }
                          },
                        );
                  }, _variations ?? [])
              ],
            ),
          ),
          if (!selected)
            const Divider(
              color: Colors.grey,
            ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                border: selected ? Border.all(color: kGrey400) : null,
                borderRadius: BorderRadius.circular(8),
                color: selected
                    ? Theme.of(context).primaryColor.withOpacity(0.1)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
