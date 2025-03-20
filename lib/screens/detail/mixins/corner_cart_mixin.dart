import 'package:flutter/material.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../models/entities/product.dart';
import '../../../widgets/product/index.dart';
import '../widgets/buy_buttom_slide_widget.dart';
import '../widgets/buy_button_widget.dart';

mixin CornerCartMixin<T extends StatefulWidget> on State<T> {
  late AnimationController _hideController;

  bool get showBottomCornerCart;

  TickerProvider get vsync;

  bool _isVisibleBuyButton = true;

  bool get isVisibleBuyButton => _isVisibleBuyButton;

  void _onInitController(AnimationController controller) {
    controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          _isVisibleBuyButton = false;
        });
      } else if (status == AnimationStatus.reverse) {
        setState(() {
          _isVisibleBuyButton = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _hideController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 450),
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _hideController.dispose();
    super.dispose();
  }

  Widget renderCornerCart({
    final Widget Function(int quantity)? builderThumnail,
    double? widthForCartIcon,
    double? cartHeight,
  }) =>
      showBottomCornerCart
          ? Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: ExpandingBottomSheet(
                key: const ValueKey('ddd'),
                hideController: _hideController,
                onInitController: _onInitController,
                builderThumnail: builderThumnail,
                widthForCartIcon: widthForCartIcon,
                cartHeight: cartHeight,
              ),
            )
          : const SizedBox();

  Widget renderFixedBuyButtonOnBottom(Product? product,
      {bool useHorizontalLayout = false}) {
    if (_isVisibleBuyButton) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: const Border(
            top: BorderSide(color: kGrey200),
          ),
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          child:
          // kProductDetail.buyButtonStyle.isSlide
          //     ?
          // BuyButtonSlideWidget(
          //         useHorizontalLayout: useHorizontalLayout,
          //       )
              // :www
          SizedBox(
                  height: 90,
                  width: 350,
                  child: BuyButtonWidget(
                      product: product,
                      useHorizontalLayout: useHorizontalLayout),
                ),
        ),
      );
    }

    return const SizedBox();
  }
}
