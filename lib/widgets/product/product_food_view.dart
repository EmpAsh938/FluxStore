import 'package:flutter/material.dart';
import 'package:fstore/widgets/product/rating_item.dart';
import 'package:html_unescape/html_unescape.dart';

import '../../common/constants.dart';
import '../../models/index.dart' show Product;
import '../../modules/dynamic_layout/config/product_config.dart';
import '../../modules/dynamic_layout/helper/helper.dart';
import '../html/index.dart' as html;
import 'action_button_mixin.dart';
import 'index.dart'
    show ProductImage, ProductOnSale, ProductPricing, ProductTitle;

class ProductFoodView extends StatefulWidget {
  final Product item;
  final double? width;
  final double? maxWidth;
  final bool hideDetail;
  final double? offset;
  final ProductConfig config;

  const ProductFoodView({
    required this.item,
    this.width,
    this.maxWidth,
    this.offset,
    this.hideDetail = false,
    required this.config,
  });

  @override
  State<ProductFoodView> createState() => _ProductFoodViewState();
}

class _ProductFoodViewState extends State<ProductFoodView>
    with ActionButtonMixin {
  Color get backgroundCardColor =>
      widget.config.backgroundColor ??
      Theme.of(context).primaryColor.withOpacity(0.2);

  Color get textColor => widget.config.backgroundColor != null
      ? widget.config.backgroundColor!.getColorBasedOnBackground
      : Colors.black;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(widget.config.borderRadius ?? 3);

    final width = (widget.maxWidth != null &&
            widget.width != null &&
            widget.width! > widget.maxWidth!)
        ? widget.maxWidth!
        : (widget.width ??
            Layout.buildProductMaxWidth(
                context: context, layout: widget.config.layout));

    Widget productInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const SizedBox(height: 10),
        ProductTitle(
          product: widget.item,
          hide: widget.config.hideTitle,
          maxLines: widget.config.titleLine,
          textCenter: true,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: textColor,
              ),
        ),
        if (widget.item.shortDescription?.isNotEmpty ?? false)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 5).copyWith(bottom: 5),
            child: html.HtmlWidget(
              widget.item.shortDescription!,
              customWidgetBuilder: (element) {
                return Text(
                  HtmlUnescape().convert(element.innerHtml),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 11),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        // const SizedBox(height: 5),
        Center(
          child: ProductPricing(
            product: widget.item,
            hide: widget.config.hidePrice,
            priceTextStyle: TextStyle(
              fontSize: 18,
              color: textColor,
            ),
          ),
        ),
        ...[
          const SizedBox(height: 5),
          Center(
            child: RatingItem(
              item: widget.item,
              config: widget.config,
              alignment: MainAxisAlignment.center,
            ),
          ),
        ],
      ],
    );

    final productImage = ProductImage(
      width: width,
      product: widget.item,
      config: widget.config,
      ratioProductImage: widget.config.imageRatio,
      offset: widget.offset,
      onTapProduct: () =>
          onTapProduct(context, product: widget.item, config: widget.config),
    );

    return GestureDetector(
      onTap: () =>
          onTapProduct(context, product: widget.item, config: widget.config),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        constraints: BoxConstraints(maxWidth: widget.maxWidth ?? width),
        width: widget.width!,
        margin: EdgeInsets.symmetric(
          horizontal: widget.config.hMargin,
          vertical: widget.config.vMargin,
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: Stack(
                children: [
                  if (widget.config.backgroundColor == null)
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: Colors.white,
                      ),
                    ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      color: backgroundCardColor,
                      boxShadow: [
                        if (widget.config.boxShadow != null)
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(
                              widget.config.boxShadow?.x ?? 0.0,
                              widget.config.boxShadow?.y ?? 0.0,
                            ),
                            blurRadius:
                                widget.config.boxShadow?.blurRadius ?? 0.0,
                          ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      width: 70,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.15),
                            blurRadius: 20,
                            spreadRadius: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: borderRadius,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Transform.scale(
                                    scale: 1.07,
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        Colors.grey.withOpacity(0.3),
                                        BlendMode.srcIn,
                                      ),
                                      child: productImage,
                                    ),
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: 1.05,
                                child: productImage,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 3),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: widget.config.hPadding,
                            vertical: widget.config.vPadding,
                          ),
                          child: productInfo,
                        ),
                      ],
                    ),
                  ),
                  Positioned.directional(
                    top: 0,
                    start: 10,
                    textDirection: Directionality.of(context),
                    child: ProductOnSale(
                      product: widget.item,
                      config: widget.config,
                      textColor: Theme.of(context)
                          .primaryColor
                          .withOpacity(0.7)
                          .getColorBasedOnBackground,
                      margin: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.7),
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // if (widget.config.showHeart && !widget.item.isEmptyProduct())
            //   Positioned.directional(
            //     bottom: 10,
            //     start: -8,
            //     textDirection: Directionality.of(context),
            //     child: HeartButton(
            //
            //       product: widget.item,
            //       size: 18,
            //     ),
            //   ),
            Positioned.directional(
              bottom: 10,
              end: 0,
              textDirection: Directionality.of(context),
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
