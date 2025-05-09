import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux_extended/store_locator/services/index.dart';
import 'package:inspireui/inspireui.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/config/models/index.dart';
import '../../../common/constants.dart';
import '../../../common/tools/tools.dart';
import '../../../generated/l10n.dart';
import '../../../menu/maintab_delegate.dart';
import '../../../models/app_model.dart';
import '../../../models/cart/cart_base.dart';
import '../../../models/entities/product.dart';
import '../../../routes/flux_navigate.dart';
import '../helpers/cart_items_helper.dart';
import '../mixins/my_cart_mixin.dart';
import '../widgets/empty_cart.dart';
import '../widgets/shopping_cart_sumary.dart';
import '../widgets/wishlist.dart';

class MyCartNormalLayout extends StatefulWidget {
  const MyCartNormalLayout({
    super.key,
    this.isModal,
    required this.hasNewAppBar,
    this.scrollController,
    this.isBuyNow,
    this.isDialogView = false,
    this.enabledTextBoxQuantity = true,
  });

  final bool? isBuyNow;
  final bool? isModal;
  final bool hasNewAppBar;
  final bool isDialogView;
  final bool enabledTextBoxQuantity;
  final ScrollController? scrollController;

  @override
  State<MyCartNormalLayout> createState() => _MyCartNormalLayoutState();
}

class _MyCartNormalLayoutState extends State<MyCartNormalLayout>
    with MyCartMixin {
  @override
  bool? get isModal => widget.isModal;

  @override
  Widget build(BuildContext context) {
    printLog('[Cart] build');
    print(' widget.isModal ${widget.isModal}');
    final localTheme = Theme.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    var layoutType = Provider.of<AppModel>(context).productDetailLayout;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;
    final appModel = Provider.of<AppModel>(context, listen: false);

    return Selector<CartModel, String?>(
      selector: (_, carModel) => '${cartModel.productsInCart.keys.firstOrNull}'
          '${cartModel.couponObj.toString()}',
      //add this Selector to reload cart screen when add product item to cart if the current cart has wallet item
      builder: (context, _, child) {
        return MediaQuery.removePadding(
          context: context,
          removeTop: widget.hasNewAppBar && widget.isModal != true,
          child: Scaffold(
            backgroundColor: appModel.darkTheme ? kGrey900 : kGrey200,
            // floatingActionButtonLocation:
            //     kAdvanceConfig.floatingCartCheckoutButtonLocation,
            // floatingActionButton:
            //     Selector<CartModel, (bool, Map<String?, Product?>, bool)>(
            //   selector: (_, cartModel) => (
            //     cartModel.calculatingDiscount,
            //     cartModel.item,
            //     cartModel.enableCheckoutButton
            //   ),
            //   builder: (context, value, child) {
            //     var calculatingDiscount = value.$1;
            //     var enableCheckoutButton = value.$3;
            //     var isReadyForCheckout =
            //         !calculatingDiscount && enableCheckoutButton;
            //     final backgroundButton =
            //         isReadyForCheckout ? const Color(0xFFEC1C24) : Colors.grey;

            //     return FloatingActionButton.extended(
            //       heroTag: null,
            //       onPressed: isReadyForCheckout
            //           ? () {
            //               if (kAdvanceConfig.alwaysShowTabBar) {
            //                 MainTabControlDelegate.getInstance()
            //                     .changeTab(RouteList.cart, allowPush: false);
            //                 // return;
            //               }
            //               onCheckout(
            //                 model: cartModel,
            //                 isDialogView: widget.isDialogView,
            //               );
            //             }
            //           : null,
            //       elevation: 0,
            //       isExtended: true,
            //       extendedTextStyle: const TextStyle(
            //         letterSpacing: 0.8,
            //         fontSize: 11,
            //         fontWeight: FontWeight.w600,
            //       ),
            //       extendedPadding:
            //           const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //       backgroundColor: backgroundButton,
            //       foregroundColor: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(9.0),
            //       ),
            //       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //       label: Selector<CartModel, int>(
            //         selector: (_, carModel) => cartModel.totalCartQuantity,
            //         builder: (context, totalCartQuantity, child) {
            //           final colorBody =
            //               backgroundButton.getColorBasedOnBackground;
            //           final style = TextStyle(color: colorBody);

            //           return Row(
            //             children: [
            //               totalCartQuantity > 0
            //                   ? (isLoading
            //                       ? Text(
            //                           S.of(context).loading.toUpperCase(),
            //                           style: style,
            //                         )
            //                       : Text(
            //                           S.of(context).checkout.toUpperCase(),
            //                           style: style,
            //                         ))
            //                   : Text(
            //                       S.of(context).startShopping.toUpperCase(),
            //                       style: style,
            //                     ),
            //               const SizedBox(width: 3),
            //               Icon(
            //                 CupertinoIcons.right_chevron,
            //                 size: 12,
            //                 color: colorBody,
            //               ),
            //             ],
            //           );
            //         },
            //       ),
            //     );
            //   },
            // ),
            body: Stack(
              children: [
                CustomScrollView(
                  controller: widget.scrollController,
                  slivers: [
                    widget.isDialogView
                        ? SliverAppBar(
                            key: UniqueKey(),
                          )
                        : SliverAppBar(
                            titleSpacing: true == widget.isModal ? 5 : null,
                            pinned: true,
                            centerTitle: false,
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
                            title: Text(
                              'My Bag',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                    SliverToBoxAdapter(
                      child: Selector<CartModel, int>(
                        selector: (_, cartModel) => cartModel.totalCartQuantity,
                        builder: (context, totalCartQuantity, child) {
                          return AutoHideKeyboard(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 400.0),
                                child: Column(
                                  children: [
                                    if (totalCartQuantity > 0)
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface),
                                        padding: const EdgeInsets.only(
                                          right: 15.0,
                                          top: 4.0,
                                        ),
                                        child: SizedBox(
                                          width: screenSize.width,
                                          child: SizedBox(
                                            width: screenSize.width /
                                                (2 /
                                                    (screenSize.height /
                                                        screenSize.width)),
                                            child: Row(
                                              children: [
                                                const SizedBox(width: 25.0),
                                                Text(
                                                  S
                                                      .of(context)
                                                      .total
                                                      .toUpperCase(),
                                                  style: localTheme
                                                      .textTheme.titleMedium!
                                                      .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(width: 8.0),
                                                Text(
                                                  '$totalCartQuantity ${S.of(context).items}',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment: Tools.isRTL(
                                                            context)
                                                        ? Alignment.centerLeft
                                                        : Alignment.centerRight,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        if (totalCartQuantity >
                                                            0) {
                                                          clearCartPopup(
                                                              context);
                                                        }
                                                      },
                                                      child: Text(
                                                        S
                                                            .of(context)
                                                            .clearCart
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                          color:
                                                              Colors.redAccent,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (totalCartQuantity > 0)
                                      const Divider(
                                        height: 1,
                                        // indent: 25,
                                      ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(height: 16.0),
                                        if (totalCartQuantity > 0)
                                          Column(
                                            children: createShoppingCartRows(
                                                cartModel,
                                                context,
                                                widget.enabledTextBoxQuantity),
                                          ),
                                        // widget.isDialogView
                                        //     ? Container()
                                        //     : const ShoppingCartSummary(),
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
                                                  color: Colors.red),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        const SizedBox(height: 4.0),
                                        widget.isDialogView
                                            ? Container()
                                            : const WishList(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                showCheckoutBottomSheet(appModel),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget showCheckoutBottomSheet(AppModel appModel) {
    final cartModel = Provider.of<CartModel>(context, listen: false);
    return Positioned(
      bottom: 0,
      left: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
          color: appModel.darkTheme ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          border: const Border(
            top: BorderSide(
              color: Colors.black12,
              width: 1.0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 2, // How much the shadow should spread
              blurRadius: 10, // Softness of the shadow
              offset: const Offset(4, 4), // X and Y offset
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag Handle
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFEC1C24),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 10),
            widget.isDialogView ? Container() : const ShoppingCartSummary(),

            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Subtotal',
            //         style: TextStyle(color: Colors.white, fontSize: 16)),
            //     Text('\$22.00',
            //         style: TextStyle(color: Colors.white, fontSize: 16)),
            //   ],
            // ),
            // const Divider(
            //     color: Colors.white38, thickness: 1, height: 20),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Total',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18)),
            //     Text('\$32.00',
            //         style: TextStyle(
            //             color: Color(0xffcc1c24),
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18)),
            //   ],
            // ),
            // const SizedBox(height: 15),

            // // Promo Code Input
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 12),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.white38),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: const Row(
            //     children: [
            //       Icon(Icons.local_offer,
            //           color: Colors.white54, size: 20),
            //       SizedBox(width: 8),
            //       Expanded(
            //         child: TextField(
            //           style: TextStyle(color: Colors.white),
            //           decoration: InputDecoration(
            //             hintText: 'Add promo code',
            //             hintStyle: TextStyle(color: Colors.white54),
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 15),

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

                return ElevatedButton(
                  onPressed: isReadyForCheckout
                      ? () async {
                          final store = await SaveStoreLocation.getStore();

                          // if (kAdvanceConfig.alwaysShowTabBar) {
                          //   MainTabControlDelegate.getInstance()
                          //       .changeTab(RouteList.cart,
                          //           allowPush: false);
                          //   // return;
                          // }
                          if (store == null || store.name == null) {
                            // Show a dialog informing the user that the delivery address needs to be selected
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                      'Pickup/Delivery Address Needed'),
                                  content: const Text(
                                      'Please select a pickup/delivery address to continue.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                            return;
                          }

                          onCheckout(
                            model: cartModel,
                            isDialogView: widget.isDialogView,
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEC1C24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                  ),
                  child: const Text('Checkout',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),

                  //         totalCartQuantity > 0
                  //             ? (isLoading
                  //                 ? Text(
                  //                     S.of(context).loading.toUpperCase(),
                  //                     style: style,
                  //                   )
                  //                 : Text(
                  //                     S.of(context).checkout.toUpperCase(),
                  //                     style: style,
                  //                   ))
                  //             : Text(
                  //                 S.of(context).startShopping.toUpperCase(),
                  //                 style: style,
                  //               ),
                  //         const SizedBox(width: 3),
                  //         Icon(
                  //           CupertinoIcons.right_chevron,
                  //           size: 12,
                  //           color: colorBody,
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // ),
                );
              },
            ),

            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey
                        .shade100, // Background color for the info icon
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.emoji_events_outlined, // Info icon
                    size: 34,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'If you proceed to checkout, you will earn ',
                          style: TextStyle(
                            color: appModel.darkTheme ? kGrey200 : kGrey900,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${calculateRewardPoints(cartModel.getSubTotal()!)} Points!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: appModel.darkTheme ? kGrey200 : kGrey900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: kToolbarHeight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // },
    // );
    // },
    // );
  }

  int calculateRewardPoints(double totalPrice) {
    return (totalPrice / 10).floor(); // Each $10 gives 1 point
  }
}
