import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux_extended/store_locator/services/index.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/tools.dart';
import '../../../generated/l10n.dart';
import '../../../models/entities/shipping_type.dart';
import '../../../models/index.dart'
    show AppModel, CartModel, PaymentMethodModel, TaxModel, UserModel;
import '../../../models/tera_wallet/index.dart';
import '../../../modules/dynamic_layout/helper/helper.dart';
import '../../../modules/native_payment/razorpay/services.dart';
import '../../../services/index.dart';
import '../../../services/wieat_service.dart';
import '../../cart/widgets/shopping_cart_sumary.dart';
import '../mixins/checkout_mixin.dart';
import 'checkout_action.dart';
import 'fygaro_payment.dart';

class PaymentMethods extends StatefulWidget {
  final Function? onBack;
  final Function? onFinish;
  final Function(bool)? onLoading;
  final bool hideCheckout;

  const PaymentMethods({
    this.onBack,
    this.onFinish,
    this.onLoading,
    this.hideCheckout = false,
  });

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods>
    with RazorDelegate, CheckoutMixin {
  double wieatCost = 0.0;
  bool isLoading = false;
  var productSubTotal = 0.0;

  Future<void> getWieatCost() async {
    try {
      setState(() {
        isLoading = true;
      });
      // final store = await SaveStoreLocation.getStore();
      // print('WIEAT');

      final cost = await SaveStoreLocation.getCost();

      // print(store.toJson());
      // final response = await WieatService().getWieatCost(
      //   store.branch_id.toString(),
      //   store.name.toString(),
      // );

      // var fare = response['data']['data']['fare'];
      if (!mounted) return;
      setState(() {
        wieatCost = cost;
        // wieatCost = (fare is int)
        //     ? fare.toDouble()
        //     : double.tryParse(fare.toString()) ?? 0.0;
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
  Function? get onBack => widget.onBack;

  @override
  Function? get onFinish => widget.onFinish;

  @override
  Function(bool)? get onLoading => widget.onLoading;

  @override
  void initState() {
    final cartModel = Provider.of<CartModel>(context, listen: false);

    Provider.of<AppModel>(context, listen: false).loadCurrency(
        callback: (currencyRate) {
      cartModel.changeCurrencyRates(currencyRate);
    });

    if (cartModel.shippingType == ShippingType.delivery) getWieatCost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    final currencyRate = Provider.of<AppModel>(context).currencyRate;
    final paymentMethodModel = Provider.of<PaymentMethodModel>(context);
    final taxModel = Provider.of<TaxModel>(context);
    final useDesktopLayout = Layout.isDisplayDesktop(context);

    var innerSubTotal = 0.0;

    for (var item in cartModel.cartItemMetaDataInCart.values) {
      if (item != null && item.selectedComponents != null) {
        for (var innerItem in item.selectedComponents!.values) {
          innerSubTotal +=
              innerItem.quantity! * double.parse(innerItem.product.price!);
        }
      }
    }

    innerSubTotal += cartModel.getSubTotal()!;

    setState(() {
      productSubTotal = innerSubTotal;
    });

    final extraFee = kPaymentConfig.smartCOD?.extraFee ?? 0;

    final body = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(S.of(context).paymentMethods,
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 5),
            Text(
              S.of(context).chooseYourPaymentMethod,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
              ),
            ),
            Services().widget.renderPayByWallet(context),
            const SizedBox(height: 20),
            Consumer2<PaymentMethodModel, WalletModel>(
                builder: (context, model, walletModel, child) {
              if (model.isLoading) {
                return SizedBox(height: 100, child: kLoadingWidget(context));
              }

              if (model.message != null) {
                return SizedBox(
                  height: 100,
                  child: Center(
                      child: Text(model.message!,
                          style: const TextStyle(color: kErrorRed))),
                );
              }
              if (paymentMethodModel.paymentMethods.isEmpty) {
                return Center(
                  child: Image.asset(
                    'assets/images/leaves.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                );
              }

              var ignoreWallet = false;
              final isWalletExisted = model.paymentMethods
                      .firstWhereOrNull((e) => e.id == 'wallet') !=
                  null;
              if (isWalletExisted) {
                final total =
                    (cartModel.getTotal() ?? 0) + cartModel.walletAmount;
                ignoreWallet = total > walletModel.balance;
              }

              if (selectedId == null && model.paymentMethods.isNotEmpty) {
                selectedId = model.paymentMethods.firstWhereOrNull((item) {
                  if (ignoreWallet) {
                    return item.id != 'wallet' && item.enabled!;
                  } else {
                    return item.enabled!;
                  }
                })?.id;
                cartModel.setPaymentMethod(
                  model.paymentMethods.firstWhereOrNull(
                    (item) => item.id == selectedId,
                  ),
                );
              }

              return Column(
                children: <Widget>[
                  for (int i = 0; i < model.paymentMethods.length; i++)
                    model.paymentMethods[i].enabled!
                        ? Services().widget.renderPaymentMethodItem(
                            context,
                            model.paymentMethods[i],
                            (i) {
                              setState(() {
                                selectedId = i;
                              });
                              final paymentMethod = paymentMethodModel
                                  .paymentMethods
                                  .firstWhere((item) => item.id == i);
                              cartModel.setPaymentMethod(paymentMethod);
                            },
                            selectedId,
                            useDesktopStyle: useDesktopLayout,
                          )
                        : const SizedBox()
                ],
              );
            }),
            if (widget.hideCheckout == false) ...[
              const ShoppingCartSummary(showPrice: false),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      S.of(context).subtotal,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.8),
                      ),
                    ),
                    Text(
                        PriceTools.getCurrencyFormatted(
                            productSubTotal, currencyRate,
                            currency: cartModel.currencyCode)!,
                        style: const TextStyle(fontSize: 14, color: kGrey400))
                  ],
                ),
              ),
              Services().widget.renderShippingMethodInfo(context),
              if (cartModel.getCoupon() != '')
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        S.of(context).discount,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                      ),
                      Text(
                        cartModel.getCoupon(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.8),
                                ),
                      )
                    ],
                  ),
                ),
              Services().widget.renderTaxes(taxModel, context),
              Services().widget.renderRewardInfo(context),
              Services().widget.renderCheckoutWalletInfo(context),
              Services().widget.renderCODExtraFee(context),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Wieat Cost',
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                            ),
                          )
                        : Text(
                            PriceTools.getCurrencyFormatted(
                                wieatCost, currencyRate,
                                currency: cartModel.currencyCode)!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      S.of(context).total,
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                            ),
                          )
                        : Text(
                            PriceTools.getCurrencyFormatted(
                                productSubTotal + wieatCost,
                                // (selectedId != 'fygaro' ? extraFee : 0),
                                currencyRate,
                                currency: cartModel.currencyCode)!,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          )
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ]
          ],
        ),
      ),
    );

    return ListenableProvider.value(
      value: paymentMethodModel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (useDesktopLayout)
            Padding(padding: const EdgeInsets.only(bottom: 50), child: body)
          else
            Expanded(child: body),
          Consumer<PaymentMethodModel>(builder: (context, model, child) {
            return _buildBottom(model, cartModel);
          })
        ],
      ),
    );
  }

  Widget _buildBottom(
      PaymentMethodModel paymentMethodModel, CartModel cartModel) {
    final userModel = Provider.of<UserModel>(context, listen: false);
    return CheckoutActionWidget(
      iconPrimary: CupertinoIcons.check_mark_circled_solid,
      labelPrimary: S.of(context).placeMyOrder,
      onTapPrimary: (paymentMethodModel.message?.isNotEmpty ?? false)
          ? null
          : () {
              if (isPaying || selectedId == null) {
                showSnackbar();
              } else {
                // if (selectedId != null && selectedId == 'fygaro') {
                //   // Launch Fygaro payment
                //   FygaroPayment.launchPayment(
                //       amount: productSubTotal + wieatCost,
                //       currency: 'USD',
                //       orderId: 'ORDER5678',
                //       kid: '12298235-f537-440c-a0e8-80f7d1388a78',
                //       clientData: {
                //         'name': userModel.user!.fullName,
                //         'email': userModel.user!.email.toString(),
                //         'phone': userModel.user!.phoneNumber.toString(),
                //       });
                // } else {
                placeOrder(paymentMethodModel, cartModel);
                // }
              }
            },
      labelSecondary: kPaymentConfig.enableReview
          ? S.of(context).goBack.toUpperCase()
          : kPaymentConfig.enableShipping
              ? S.of(context).goBackToShipping
              : S.of(context).goBackToAddress,
      onTapSecondary: () {
        isPaying ? showSnackbar : widget.onBack!();
      },
      showSecondary: kPaymentConfig.enableShipping ||
          kPaymentConfig.enableAddress ||
          kPaymentConfig.enableReview,
      showPrimary: widget.hideCheckout == false,
    );
  }
}
