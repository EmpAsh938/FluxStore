import 'dart:convert';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flux_extended/store_locator/services/index.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/config/models/cart_config.dart';
import '../../../common/tools.dart';
import '../../../generated/l10n.dart';
import '../../../models/index.dart'
    show AppModel, BranchModel, CartModel, Coupons, Discount;
import '../../../models/tax_model.dart';
import '../../../services/index.dart';
import '../../../services/wieat_service.dart';
import '../../../widgets/product/cart_item/cart_item_state_ui.dart';
import 'coupon_action_widget.dart';
import 'coupon_list.dart';
import 'order_summary_web_widget.dart';
import 'point_reward.dart';

class ShoppingCartSummary extends StatefulWidget {
  final bool showPrice;
  final bool showRecurringTotals;
  final CartStyle cartStyle;
  final OrderSummaryStyle style;

  const ShoppingCartSummary({
    this.showPrice = true,
    this.showRecurringTotals = true,
    this.cartStyle = CartStyle.normal,
    this.style = OrderSummaryStyle.normal,
  });

  @override
  State<ShoppingCartSummary> createState() => _ShoppingCartSummaryState();
}

class _ShoppingCartSummaryState extends State<ShoppingCartSummary> {
  final services = Services();
  late var _orderSummaryStyle = widget.style;
  Coupons? coupons;
  bool isLoading = false;

  String _productsInCartJson = '';
  final _debounceApplyCouponTag = 'debounceApplyCouponTag';
  final defaultCurrency = kAdvanceConfig.defaultCurrency;
  double wieatCost = 0.0;

  CartModel get cartModel => Provider.of<CartModel>(context, listen: false);

  final couponController = TextEditingController();

  final bool _showCouponList =
      kAdvanceConfig.showCouponList && ServerConfig().isSupportCouponList;

  void _onProductInCartChange(CartModel cartModel) {
    // If app success a coupon before
    // Need to apply again when any change in cart
    EasyDebounce.debounce(
        _debounceApplyCouponTag, const Duration(milliseconds: 300), () {
      if (cartModel.productsInCart.isEmpty) {
        removeCoupon(cartModel);
        return;
      }
      final newData = jsonEncode(cartModel.productsInCart);
      if (_productsInCartJson != newData) {
        _productsInCartJson = newData;
        checkCoupon(couponController.text, cartModel);
      }
    });
  }

  void _onTapShowListCounpon() {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => CouponList(
          isFromCart: true,
          coupons: coupons,
          onSelect: (String couponCode) {
            Future.delayed(const Duration(milliseconds: 250), () {
              couponController.text = couponCode;
              checkCoupon(couponController.text, cartModel);
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    couponController.dispose();
    super.dispose();
  }

  Future<void> getCoupon() async {
    try {
      coupons = await services.api.getCoupons();
    } catch (e) {
//      print(e.toString());
    }
  }

  void showError(String message) {
    final snackBar = SnackBar(
      content: Text(S.of(context).warning(message)),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: S.of(context).close,
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Check coupon code
  void checkCoupon(String couponCode, CartModel cartModel) {
    if (couponCode.isEmpty) {
      showError(S.of(context).pleaseFillCode);
      return;
    }

    cartModel.setLoadingDiscount();

    Services().widget.applyCoupon(
      context,
      coupons: coupons,
      code: couponCode,
      success: (Discount discount) async {
        await cartModel.updateDiscount(discount: discount);
        cartModel.setLoadedDiscount();
      },
      error: (String errMess) {
        if (cartModel.couponObj != null) {
          removeCoupon(cartModel);
        }
        cartModel.setLoadedDiscount();
        showError(errMess);
      },
    );
  }

  Future<void> removeCoupon(CartModel cartModel) async {
    await Services().widget.removeCoupon(context);
    cartModel.resetCoupon();
    cartModel.discountAmount = 0.0;
  }

  Future<void> getWieatCost() async {
    try {
      final store = await SaveStoreLocation.getStore();
      print('WIEAT');

      final response = await WieatService().getWieatCost(
        store.branch_id.toString(),
        store.name.toString(),
      );
      // final branches = await Services().api.getAllBranches();

      print('WIEAT RESPONSEE');
      print(response);
      // print(branches);
      var fare = response['data']['data']['fare'];
      if (!mounted) return;

      setState(() {
        wieatCost = (fare is int)
            ? fare.toDouble()
            : double.tryParse(fare.toString()) ?? 0.0;

        SaveStoreLocation.saveCost(wieatCost);
      });
    } catch (e) {
      print('WIEATRESPONSE');
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // getWieatCost();
    getCoupon();
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (mounted) {
        // if (cartModel.couponObj != null && cartModel.couponObj!.amount! > 0) {
        //   final savedCoupon = cartModel.savedCoupon;
        //   couponController.text = savedCoupon ?? '';
        // }
        final savedCoupon = cartModel.savedCoupon;
        couponController.text = savedCoupon ?? '';
        _productsInCartJson = jsonEncode(cartModel.productsInCart);
      }
    });
  }

  @override
  void didUpdateWidget(covariant ShoppingCartSummary oldWidget) {
    if (widget.style != oldWidget.style) {
      _orderSummaryStyle = widget.style;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final taxModel = Provider.of<TaxModel>(context, listen: false);
    final currency = Provider.of<AppModel>(context).currency;
    final currencyRate = Provider.of<AppModel>(context).currencyRate;
    final smallAmountStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontWeight: FontWeight.w900,
    );

    final smallAmountTitleStyle = smallAmountStyle.copyWith(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.5));

    final largeAmountStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 20,
    );
    final formatter = NumberFormat.currency(
      locale: 'en',
      symbol: defaultCurrency?.symbol,
      decimalDigits: defaultCurrency?.decimalDigits,
    );
    final screenSize = MediaQuery.sizeOf(context);

    var productSubTotal = 0.0;

    for (var item in cartModel.cartItemMetaDataInCart.values) {
      if (item != null && item.selectedComponents != null) {
        for (var innerItem in item.selectedComponents!.values) {
          productSubTotal +=
              innerItem.quantity! * double.parse(innerItem.product.price!);
        }
      }
    }

    productSubTotal += cartModel.getSubTotal()!;

    if (cartModel.getTotal()! > productSubTotal) {
      productSubTotal = cartModel.getTotal()!;
    }
    return Consumer<CartModel>(builder: (context, cartModel, child) {
      var couponMsg = '';
      var isApplyCouponSuccess = false;

      if (cartModel.couponObj != null &&
          (cartModel.couponObj!.amount ?? 0) > 0) {
        isApplyCouponSuccess = true;
        _onProductInCartChange(cartModel);
        couponController.text = cartModel.couponObj!.code ?? '';
        couponMsg = S.of(context).couponMsgSuccess;

        if (cartModel.couponObj!.discountType == 'percent') {
          couponMsg += ' ${cartModel.couponObj!.amount}%';
        } else {
          couponMsg += ' - ${formatter.format(cartModel.couponObj!.amount)}';
        }
      } else {
        couponController.clear();
      }

      if (cartModel.productsInCart.isEmpty) {
        return const SizedBox();
      }

      final enableCoupon =
          kAdvanceConfig.enableCouponCode && !cartModel.isWalletCart();
      final enablePointReward = !cartModel.isWalletCart();
      print("enablePointReward $enablePointReward");
      if (_orderSummaryStyle.isWeb) {
        return OrderSummaryWebWidget(
          cartModel: cartModel,
          showPrice: widget.showPrice,
          enableCoupon: enableCoupon,
          isApplyCouponSuccess: isApplyCouponSuccess,
          checkCoupon: checkCoupon,
          removeCoupon: removeCoupon,
          couponController: couponController,
          style: _orderSummaryStyle,
        );
      }

      return SizedBox(
        width: screenSize.width,
        child: SizedBox(
          width:
              screenSize.width / (2 / (screenSize.height / screenSize.width)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (enableCoupon)
                CouponActionWidget(
                  cartModel: cartModel,
                  couponController: couponController,
                  isApplyCouponSuccess: isApplyCouponSuccess,
                  onTapShowListCounpon: _onTapShowListCounpon,
                  showCouponList: _showCouponList,
                  style: widget.cartStyle,
                  checkCoupon: checkCoupon,
                  removeCoupon: removeCoupon,
                ),
              if (isApplyCouponSuccess)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    bottom: 15,
                    top: 10,
                  ),
                  child: Text(
                    couponMsg,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (enablePointReward) const PointReward(),
              if (widget.showPrice)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 15.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).itemTotal,
                                style: smallAmountTitleStyle,
                              ),
                            ),
                            Text(
                              // '\$${cartModel.getSubTotal()?.toStringAsFixed(2)}',
                              '\$${productSubTotal.toStringAsFixed(2)}',
                              style: smallAmountStyle,
                            ),
                          ],
                        ),
                        if (cartModel.rewardTotal > 0) ...[
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  S.of(context).cartDiscount,
                                  style: smallAmountTitleStyle,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                PriceTools.getCurrencyFormatted(
                                    cartModel.rewardTotal, currencyRate,
                                    currency: currency)!,
                                style: smallAmountStyle,
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 10),
                        Services().widget.renderTaxes(
                              taxModel,
                              context,
                              padding: const EdgeInsets.all(0),
                              style: smallAmountStyle,
                              styleTitle: smallAmountTitleStyle,
                            ),
                        const SizedBox(height: 15),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Text(
                        //         'Wieat Cost',
                        //         style: smallAmountTitleStyle,
                        //       ),
                        //     ),
                        //     const SizedBox(height: 10),
                        //     isLoading
                        //         ? const SizedBox(
                        //             width: 20,
                        //             height: 20,
                        //             child: CircularProgressIndicator(
                        //               strokeWidth: 2.0,
                        //             ),
                        //           )
                        //         : Text(
                        //             PriceTools.getCurrencyFormatted(
                        //                 wieatCost, currencyRate,
                        //                 currency: currency)!,
                        //             style: smallAmountStyle,
                        //           ),
                        //   ],
                        // ),
                        // const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${S.of(context).total}:',
                                style: largeAmountStyle.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            cartModel.calculatingDiscount || isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                    ),
                                  )
                                : Text(
                                    PriceTools.getCurrencyFormatted(
                                        productSubTotal -
                                            // cartModel.getTotal()! -
                                            cartModel.getShippingCost()! +
                                            wieatCost,
                                        currencyRate,
                                        currency: cartModel.isWalletCart()
                                            ? defaultCurrency?.currencyCode
                                            : currency)!,
                                    style: largeAmountStyle.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              if (widget.showRecurringTotals)
                Services().widget.renderRecurringTotals(context)
            ],
          ),
        ),
      );
    });
  }
}
