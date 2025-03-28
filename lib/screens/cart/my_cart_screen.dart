import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart' show printLog;
import 'package:provider/provider.dart';

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../models/cart/cart_item_meta_data.dart';
import '../../models/index.dart';
import '../../modules/dynamic_layout/helper/helper.dart';
import '../../widgets/product/cart_item/cart_item_state_ui.dart';
import '../detail/local/cart.dart';
import 'my_cart_layout/my_cart_normal_layout.dart';
import 'my_cart_layout/my_cart_normal_layout_web.dart';
import 'my_cart_layout/my_cart_style01_layout.dart';
import 'my_cart_layout/my_cart_style02_layout.dart';

class MyCart extends StatefulWidget {
  final bool? isModal;
  final bool? isBuyNow;
  final bool hasNewAppBar;
  final bool enabledTextBoxQuantity;
  final ScrollController? scrollController;

  const MyCart({
    this.isModal,
    this.isBuyNow = false,
    this.hasNewAppBar = false,
    this.enabledTextBoxQuantity = true,
    this.scrollController,
  });

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // final cartModel = Provider.of<CartModel>(context, listen: false);
    // cartModel. = {};
  }

  @override
  Widget build(BuildContext context) {
    printLog('[Cart] build');

    final cartStyle = CartStyle.fromString(kCartDetail['style'].toString());
    if (Layout.isDisplayDesktop(context)) {
      return MyCartNormalLayoutWeb(
        hasNewAppBar: widget.hasNewAppBar,
        enabledTextBoxQuantity: widget.enabledTextBoxQuantity,
        isModal: widget.isModal,
        isBuyNow: widget.isBuyNow,
        scrollController: widget.scrollController,
      );
    }
    print("cartStyle ${cartStyle}");
    print("widget.hasNewAppBar ${widget.hasNewAppBar}");
    print("widget.enabledTextBoxQuantity ${widget.enabledTextBoxQuantity}");
    print(" widget.isModal ${widget.isModal}");
    print(" widget.isModal ${widget.isModal}");
    print(" widget.isBuyNow ${widget.isBuyNow}");
    print(" widget.scrollController ${widget.scrollController}");

    switch (cartStyle) {
      case CartStyle.style01:
        return MyCartStyle01Layout(
          hasNewAppBar: widget.hasNewAppBar,
          isModal: widget.isModal,
          isBuyNow: widget.isBuyNow,
          scrollController: widget.scrollController,
          enabledTextBoxQuantity: widget.enabledTextBoxQuantity,
        );
      case CartStyle.style02:
        return MyCartStyle02Layout(
          hasNewAppBar: widget.hasNewAppBar,
          isModal: widget.isModal,
          isBuyNow: widget.isBuyNow,
          scrollController: widget.scrollController,
          enabledTextBoxQuantity: widget.enabledTextBoxQuantity,
        );
      case CartStyle.normal:
      default:
        return MyCartNormalLayout(
          hasNewAppBar: widget.hasNewAppBar,
          enabledTextBoxQuantity: widget.enabledTextBoxQuantity,
          isModal: widget.isModal,
          isBuyNow: widget.isBuyNow,
          scrollController: widget.scrollController,
        );
    }
  }
}
