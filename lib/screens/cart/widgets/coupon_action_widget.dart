import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../models/cart/cart_base.dart';
import '../../../widgets/common/flux_image.dart';
import '../../../widgets/product/cart_item/cart_item_state_ui.dart';

class CouponActionWidget extends StatelessWidget {
  const CouponActionWidget({
    super.key,
    required bool showCouponList,
    required this.couponController,
    required this.cartModel,
    required this.isApplyCouponSuccess,
    required this.style,
    this.checkCoupon,
    this.removeCoupon,
    required this.onTapShowListCounpon,
  }) : _showCouponList = showCouponList;

  final bool _showCouponList;
  final bool isApplyCouponSuccess;
  final TextEditingController couponController;
  final CartModel cartModel;
  final CartStyle style;
  final void Function(String, CartModel)? checkCoupon;
  final void Function(CartModel)? removeCoupon;
  final void Function() onTapShowListCounpon;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case CartStyle.style02:
        return Center(
          child: ElevatedButton(
            onPressed: onTapShowListCounpon,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FluxImage(
                    imageUrl: 'assets/images/no_coupon.png',
                    width: 30,
                    color: Colors.yellow,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Apply counpons'),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
          ),
        );
      case CartStyle.normal:
      case CartStyle.style01:
      default:
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: style.isStyle01
              ? BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(5),
                )
              : null,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  decoration: !isApplyCouponSuccess
                      ? BoxDecoration(color: Theme.of(context).cardColor)
                      : BoxDecoration(
                          color: Theme.of(context).primaryColorLight),
                  child: GestureDetector(
                    onTap: _showCouponList ? onTapShowListCounpon : null,
                    child: AbsorbPointer(
                      absorbing: _showCouponList,
                      child: TextField(
                        controller: couponController,
                        autocorrect: false,
                        enabled: !isApplyCouponSuccess &&
                            !cartModel.calculatingDiscount,
                        decoration: InputDecoration(
                          prefixIcon: _showCouponList
                              ? Icon(
                                  CupertinoIcons.search,
                                  color: Theme.of(context).primaryColor,
                                )
                              : null,
                          labelText: S.of(context).couponCode,
                          contentPadding: const EdgeInsets.all(2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).primaryColorLight,
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
                label: Text(
                  cartModel.calculatingDiscount
                      ? S.of(context).loading
                      : !isApplyCouponSuccess
                          ? S.of(context).apply
                          : S.of(context).remove,
                ),
                icon: const Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  size: 18,
                ),
                onPressed: !cartModel.calculatingDiscount
                    ? () {
                        if (!isApplyCouponSuccess) {
                          checkCoupon?.call(couponController.text, cartModel);
                        } else {
                          removeCoupon?.call(cartModel);
                        }
                      }
                    : null,
              )
            ],
          ),
        );
    }
  }
}
