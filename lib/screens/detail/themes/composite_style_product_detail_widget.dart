import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../models/cart/cart_base.dart';
import '../../../models/entities/product.dart';
import '../../../modules/dynamic_layout/config/product_config.dart';
import '../../../routes/flux_navigate.dart';
import '../../../services/index.dart'; //
import '../../../widgets/common/flux_image.dart';
import '../../../widgets/product/widgets/heart_button.dart';
import '../../cart/mixins/my_cart_mixin.dart';
import '../mixins/corner_cart_mixin.dart';
import '../mixins/detail_product_mixin.dart';
import '../mixins/detail_product_price_mixin.dart';
import '../widgets/buy_button_widget.dart';
import '../widgets/product_common_info.dart';
import '../widgets/product_description.dart'; //
import '../widgets/product_detail_categories.dart'; //
import '../widgets/product_short_description.dart'; //
import '../widgets/product_tag.dart'; //
import '../widgets/recent_product.dart'; //
import '../widgets/related_product.dart'; //
import '../widgets/related_product_from_same_store.dart'; //
import 'detail_product_layout.dart';

const _kSizeBttomWidget = 115.0;

class CompositeStyleDetailProductWidget extends StatefulWidget {
  const CompositeStyleDetailProductWidget(
    this.stateUI, {
    super.key,
    this.isModal,
    required this.product,
    required this.isProductInfoLoading,
  });

  final Product product;
  final bool isProductInfoLoading;
  final bool? isModal;
  final DetailProductStateUI stateUI;

  @override
  State<CompositeStyleDetailProductWidget> createState() =>
      _CompositeStyleDetailProductWidgetState();
}

class _CompositeStyleDetailProductWidgetState
    extends State<CompositeStyleDetailProductWidget>
    with
        MyCartMixin,
        SingleTickerProviderStateMixin,
        CornerCartMixin,
        DetailProductMixin,
        DetailProductPriceMixin {
  final _priceWidgetController = ValueNotifier<double>(0.0);
  double _power = 0;
  bool _scrollUp = false;

  DetailProductStateUI get stateUI => widget.stateUI;

  bool _listenerNotificationOfScroll(Notification notification) {
    if (enableAutoHideButtonBuy) {
      if (notification is ScrollUpdateNotification) {
        var deltaScroll = (notification.dragDetails?.delta.dy ?? 0.0);

        var deltaScrollUpSpeed = deltaScroll;
        if (deltaScrollUpSpeed > 0) {
          _scrollUp = true;
        } else if (deltaScrollUpSpeed < 0) {
          _scrollUp = false;
        }

        if (_scrollUp) {
          if (_power < 0) {
            _power = 0;
          }
          _power++;
          deltaScrollUpSpeed += _power;
        } else {
          if (_power > 0) {
            _power = 0;
          }
          _power--;
          deltaScrollUpSpeed += _power;
        }

        if (deltaScrollUpSpeed.abs() < 1) {
          deltaScroll = deltaScrollUpSpeed;
        } else {
          _power = 0;
        }

        final delta = _priceWidgetController.value + deltaScroll;

        _priceWidgetController.value = delta > 0
            ? 0
            : delta < -_kSizeBttomWidget
                ? -_kSizeBttomWidget
                : delta;
      } else if (notification is UserScrollNotification &&
          notification.direction == ScrollDirection.idle) {
        if ((_priceWidgetController.value).abs() > (_kSizeBttomWidget * 0.8)) {
          _priceWidgetController.value = -_kSizeBttomWidget;
        } else {
          _priceWidgetController.value = 0;
        }
      }
    }
    return true;
  }

  @override
  TickerProvider get vsync => this;

  @override
  bool get showBottomCornerCart => stateUI.showBottomCornerCart;

  @override
  bool get isLoading => widget.isProductInfoLoading;

  @override
  Product get product => widget.product;

  @override
  Product get productData => widget.product;

  @override
  bool get enableVendorChat => stateUI.enableVendorChat;

  bool get enableAutoHideButtonBuy =>
      product.isVariableProduct ||
      product.isSimpleProduct ||
      product.isNofoundType;

  @override
  void onUpdateVariant() {
    _priceWidgetController.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final detailPriceData = calculatorPrice();
    print(
        "kProductDetail.fixedBuyButtonToBottom ${kProductDetail.fixedBuyButtonToBottom}");
    print("enableAutoHideButtonBuy $enableAutoHideButtonBuy");
    return Column(
      children: [
        Expanded(
          child: _renderDetailProduct(detailPriceData),
        ),
        // if (kProductDetail.fixedBuyButtonToBottom &&
        //     enableAutoHideButtonBuy == false)
        renderFixedBuyButtonOnBottom(product, useHorizontalLayout: false),
      ],
    );
  }

  Widget _renderDetailProduct(DetailProductPriceStateUI detailPriceData) {
    print(
        "lallalalalalalalal ${Provider.of<CartModel>(context, listen: true).getTotal()}");
    print("isVisibleBuyButton $isVisibleBuyButton");
    print("enableAutoHideButtonBuy $enableAutoHideButtonBuy");
    final totalPrice = Provider.of<CartModel>(context, listen: true).getTotal();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: floatingActionButton,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: NotificationListener(
        onNotification: _listenerNotificationOfScroll,
        child: Stack(
          children: [
            CustomScrollView(
              controller: stateUI.scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  floating: true,
                  centerTitle: true,
                  automaticallyImplyLeading: true,
                  // backgroundColor: Theme.of(context).primaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/app-bg.png'), // Change to your image path
                          fit: BoxFit.cover, // Cover the entire AppBar
                        ),
                      ),
                    ),
                  ),
                  title: Image.asset(
                    kLogoImage,
                    height: 50,
                  ),
                  leading: ElevatedButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: const Text('Back'),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () => FluxNavigate.pushNamed(RouteList.cart,
                          context: context),
                      behavior: HitTestBehavior.translucent,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 4, top: 2, bottom: 2),
                        child: SizedBox(
                          width: 100,
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'My Bag',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 8.0,
                                        ),
                                      ),
                                      Text(
                                        '\$ $totalPrice',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 10.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: Text(
                                      Provider.of<CartModel>(context,
                                              listen: true)
                                          .totalCartQuantity
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () => FluxNavigate.pushNamed(RouteList.cart,
                    //       context: context),
                    //   behavior: HitTestBehavior.translucent,
                    //   child: Center(
                    //     child: Container(
                    //       margin: const EdgeInsetsDirectional.only(end: 10),
                    //       height: 23,
                    //       width: 45,
                    //       decoration: BoxDecoration(
                    //           color: Colors.white54,
                    //           borderRadius: BorderRadius.circular(30)),
                    //       child: Row(
                    //         children: [
                    //           const Expanded(
                    //             child: Center(
                    //               child: Padding(
                    //                 padding:
                    //                     EdgeInsetsDirectional.only(start: 5),
                    //                 child: Icon(
                    //                   CupertinoIcons.cart,
                    //                   size: 14,
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //           const SizedBox(width: 3),
                    //           Center(
                    //             child: Container(
                    //               margin: const EdgeInsets.all(3),
                    //               width: 18,
                    //               height: 18,
                    //               decoration: BoxDecoration(
                    //                   color: Colors.white,
                    //                   borderRadius: BorderRadius.circular(20)),
                    //               child: FittedBox(
                    //                 fit: BoxFit.contain,
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.all(3.0),
                    //                   child: Center(
                    //                     child: Text(
                    //                       Provider.of<CartModel>(context,
                    //                               listen: true)
                    //                           .totalCartQuantity
                    //                           .toString(),
                    //                       style: const TextStyle(
                    //                         fontWeight: FontWeight.w800,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: AppBarFoot(product: widget.product),
                ),
                if (stateUI.enableShoppingCart)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: ProductCommonInfo(
                        product: widget.product,
                        isProductInfoLoading: widget.isProductInfoLoading,
                        showBuyButton: enableAutoHideButtonBuy == false,
                        wrapSliver: false,
                      ),
                    ),
                  ),
                if (!stateUI.enableShoppingCart &&
                    widget.product.shortDescription != null &&
                    widget.product.shortDescription!.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: ProductShortDescription(widget.product),
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      // horizontal: 15.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                          child: Column(
                            children: [
                              Services()
                                  .widget
                                  .renderVendorInfo(widget.product),
                              ProductDescription(widget.product),
                              if (kProductDetail.showProductCategories)
                                ProductDetailCategories(widget.product),
                              if (kProductDetail.showProductTags)
                                ProductTag(widget.product),
                              if (widget.isProductInfoLoading == false)
                                Services()
                                    .widget
                                    .productReviewWidget(widget.product),
                            ],
                          ),
                        ),
                        if (kProductDetail.showRelatedProductFromSameStore &&
                            widget.product.store?.id != null)
                          RelatedProductFromSameStore(
                            widget.product,
                            config: ProductConfig.empty()
                              ..imageBoxfit = 'contain',
                          ),
                        if (kProductDetail.showRelatedProduct &&
                            widget.isProductInfoLoading == false)
                          RelatedProduct(
                            widget.product,
                            config: ProductConfig.empty()
                              ..imageBoxfit = 'contain',
                          ),
                        if (kProductDetail.showRecentProduct)
                          RecentProducts(
                            excludeProduct: widget.product,
                            config: ProductConfig.empty()
                              ..imageBoxfit = 'contain',
                          ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // if (isVisibleBuyButton && enableAutoHideButtonBuy)
            //   ValueListenableBuilder(
            //     valueListenable: _priceWidgetController,
            //     builder: (_, position, __) {
            //       final sizeKeyboard = MediaQuery.of(context).viewInsets.bottom;
            //       return Positioned(
            //         bottom: sizeKeyboard > 0 ? sizeKeyboard : position,
            //         child: Container(
            //           width: MediaQuery.sizeOf(context).width,
            //           decoration: BoxDecoration(
            //             boxShadow: [
            //               BoxShadow(
            //                 blurRadius: 1,
            //                 spreadRadius: 1,
            //                 color: Theme.of(context)
            //                     .scaffoldBackgroundColor
            //                     .withOpacity(1),
            //                 offset: const Offset(0, -1),
            //               )
            //             ],
            //           ),
            //           child: ClipPath(
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 color: Theme.of(context)
            //                     .colorScheme
            //                     .surface
            //                     .withOpacity(0.5),
            //               ),
            //               height: _kSizeBttomWidget,
            //               width: MediaQuery.sizeOf(context).width,
            //               padding: const EdgeInsetsDirectional.only(
            //                 start: 16,
            //                 end: 16,
            //                 bottom: 20,
            //                 top: 5,
            //               ),
            //               child: Builder(builder: (context) {
            //                 return BackdropFilter(
            //                   filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            //                   child: const BuyButtonWidget(
            //                     showQuantity: false,
            //                     useHorizontalLayout: true,
            //                   ),
            //                 );
            //               }),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
          ],
        ),
      ),
    );
  }

  @override
  bool? get isModal => widget.isModal;
}

class AppBarFoot extends StatelessWidget {
  const AppBarFoot({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    const widthImage = 240.0;
    const heightBackground = 220.0;
    const sizeDefaultBackground = 200.0;
    const scaleBackground = 3.5;
    const scaleShadownImage = 1.02;
    const marginBottom = 100.0;

    final image = FluxImage(
      imageUrl: product.imageFeature ?? '',
    );
    return SizedBox(
      height: heightBackground,
      child: Stack(
        children: [
          Transform.scale(
            scale: scaleBackground,
            child: Center(
              child: Container(
                width: sizeDefaultBackground,
                height: sizeDefaultBackground,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(sizeDefaultBackground),
                    bottomRight: Radius.circular(sizeDefaultBackground),
                  ),
                  color: Theme.of(context).primaryColor,
                  image: const DecorationImage(
                      image: AssetImage('assets/images/app-bg.png'),
                      fit: BoxFit.cover),
                ),
                margin: const EdgeInsets.only(bottom: marginBottom),
              ),
            ),
          ),
          Positioned.fill(
            child: SizedBox(
              height: heightBackground,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(top: 8),
                    child: Text(
                      product.name!,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(fontSizeFactor: 1.2)
                          .copyWith(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: widthImage,
                                child: Transform.scale(
                                  scale: scaleShadownImage,
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      Colors.grey.withOpacity(0.3),
                                      BlendMode.srcIn,
                                    ),
                                    child: image,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: ClipRRect(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: widthImage,
                                child: image,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // if (widget.isLoading != true)
          Positioned.directional(
            bottom: 0,
            end: 0,
            textDirection: Directionality.of(context),
            child: HeartButton(
              product: product,
              size: 20.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
