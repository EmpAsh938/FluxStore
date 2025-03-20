import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../generated/l10n.dart';
import '../../../menu/maintab_delegate.dart';
import '../../../models/app_model.dart';
import '../../../models/cart/cart_base.dart';
import '../../../models/entities/product.dart';
import '../../../models/tax_model.dart';
import '../../../models/user_model.dart';
import '../../../widgets/common/index.dart';
import '../../../widgets/product/cart_item/cart_item_state_ui.dart';
import '../helpers/cart_items_helper.dart';
import '../mixins/my_cart_mixin.dart';
import '../widgets/empty_cart.dart';
import '../widgets/shopping_cart_sumary.dart';

class MyCartStyle02Layout extends StatefulWidget {
  const MyCartStyle02Layout({
    super.key,
    this.isModal,
    required this.hasNewAppBar,
    this.scrollController,
    this.isBuyNow,
    this.enabledTextBoxQuantity = true,
  });

  final bool? isBuyNow;
  final bool? isModal;
  final bool hasNewAppBar;
  final bool enabledTextBoxQuantity;
  final ScrollController? scrollController;

  @override
  State<MyCartStyle02Layout> createState() => _MyCartStyle02LayoutState();
}

class _MyCartStyle02LayoutState extends State<MyCartStyle02Layout>
    with MyCartMixin {
  @override
  bool? get isModal => widget.isModal;

  void fetchTax() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TaxModel>(context, listen: false).getTaxes(
          Provider.of<CartModel>(context, listen: false),
          Provider.of<UserModel>(context, listen: false).user?.cookie,
          (taxesTotal, taxes, isIncludingTax) {
        Provider.of<CartModel>(context, listen: false)
            .setTaxInfo(taxes, taxesTotal, isIncludingTax);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTax();
  }

  @override
  Widget build(BuildContext context) {
    printLog('[Cart] build');
    var layoutType = Provider.of<AppModel>(context).productDetailLayout;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;

    return Selector<CartModel, String?>(
      selector: (_, cartModel) => '${cartModel.productsInCart.keys.firstOrNull}'
          '${cartModel.productsInCart.entries.firstOrNull}'
          '${cartModel.couponObj.toString()}',
      //add this Selector to reload cart screen when add product item to cart if the current cart has wallet item
      builder: (context, _, child) {
        fetchTax();

        return MediaQuery.removePadding(
          context: context,
          removeTop: widget.hasNewAppBar && widget.isModal != true,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Selector<CartModel, int>(
                selector: (_, cartModel) => cartModel.totalCartQuantity,
                builder: (context, totalCartQuantity, child) {
                  return Column(
                    children: [
                      Expanded(
                        child: CustomScrollView(
                          controller: widget.scrollController,
                          slivers: [
                            SliverAppBar(
                              pinned: true,
                              centerTitle: true,
                              elevation: 1,
                              leading: widget.isModal == true
                                  ? CloseButton(
                                      onPressed: () => onPressedClose(
                                          layoutType, widget.isBuyNow),
                                    )
                                  : canPop
                                      ? const BackButton()
                                      : null,
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              actions: [
                                IconButton(
                                  onPressed: () {
                                    if (totalCartQuantity > 0) {
                                      clearCartPopup(context);
                                    }
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.delete_solid,
                                    size: 20.0,
                                  ),
                                ),
                              ],
                              title: Text(
                                S.of(context).myCart,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: AutoHideKeyboard(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 80.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(height: 16.0),
                                        if (totalCartQuantity > 0)
                                          Column(
                                            children: createShoppingCartRows(
                                              cartModel,
                                              context,
                                              widget.enabledTextBoxQuantity,
                                            ),
                                          ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        const ShoppingCartSummary(
                                          cartStyle: CartStyle.style02,
                                        ),
                                        if (totalCartQuantity == 0)
                                          const EmptyCart(),
                                        if (errMsg.isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 10,
                                            ),
                                            child: Text(
                                              errMsg,
                                              style: const TextStyle(
                                                color: Colors.red,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        const SizedBox(height: 4.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      renderTotalPrice(cartModel),
                    ],
                  );
                }),
          ),
        );
      },
    );
  }

  Widget renderTotalPrice(CartModel modelCart) {
    // final currency = Provider.of<AppModel>(context).currency;
    // final currencyRate = Provider.of<AppModel>(context).currencyRate;
    // final smallAmountStyle =
    //     TextStyle(color: Theme.of(context).colorScheme.secondary);

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).appBarTheme.shadowColor ??
                  Colors.grey.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(0, -0.5),
            )
          ]),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      child: SafeArea(
        top: false,
        bottom: (widget.isModal ?? false) ? true : false,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context)
                        .primaryColor
                        .getColorBasedOnBackground,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: FluxImage(
                    imageUrl: 'assets/images/card.svg',
                    color: Theme.of(context).primaryColor,
                    height: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Transform.scale(
                    scale: 2,
                    child: FluxImage(
                      imageUrl: 'assets/images/arrow.png',
                      color: Theme.of(context)
                          .primaryColor
                          .getColorBasedOnBackground,
                      height: 45,
                    ),
                  ),
                ),
                Expanded(
                  child:
                      Selector<CartModel, (bool, Map<String?, Product?>, bool)>(
                    selector: (_, cartModel) => (
                      cartModel.calculatingDiscount,
                      cartModel.item,
                      cartModel.enableCheckoutButton
                    ),
                    builder: (context, value, child) {
                      var calculatingDiscount = value.$1;
                      var enableCheckoutButton = value.$3;
                      var isReadyForCheckout =
                          !calculatingDiscount && enableCheckoutButton;
                      final style = TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context)
                            .primaryColor
                            .getColorBasedOnBackground,
                      );

                      return Selector<CartModel, int>(
                          selector: (_, carModel) =>
                              cartModel.totalCartQuantity,
                          builder: (context, totalCartQuantity, child) {
                            return Consumer<TaxModel>(
                              builder: (_, taxModel, __) {
                                return Center(
                                  child: SizedBox(
                                    width: 150,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: isReadyForCheckout &&
                                              taxModel.isLoadingTax == false
                                          ? () {
                                              if (kAdvanceConfig
                                                  .alwaysShowTabBar) {
                                                MainTabControlDelegate
                                                        .getInstance()
                                                    .changeTab(RouteList.cart,
                                                        allowPush: false);
                                              }
                                              onCheckout(model:cartModel);
                                            }
                                          : null,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: totalCartQuantity > 0
                                            ? (isLoading
                                                ? Text(
                                                    S
                                                        .of(context)
                                                        .loading
                                                        .toUpperCase(),
                                                    style: style,
                                                  )
                                                : Text(
                                                    'Checkout Now',
                                                    style: style,
                                                  ))
                                            : Text(
                                                S
                                                    .of(context)
                                                    .startShopping
                                                    .toUpperCase(),
                                                style: style,
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
