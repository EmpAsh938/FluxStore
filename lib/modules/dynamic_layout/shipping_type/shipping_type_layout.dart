import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/cart/cart_base.dart';
import '../../../models/entities/shipping_type.dart';

class ShippingTypeLayout extends StatefulWidget {
  const ShippingTypeLayout({super.key});

  @override
  State<ShippingTypeLayout> createState() => _ShippingTypeLayoutState();
}

class _ShippingTypeLayoutState extends State<ShippingTypeLayout> {
  late ShippingType _shippingType =
      Provider.of<CartModel>(context, listen: false).shippingType;
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return Container(
      height: 46,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
      decoration: BoxDecoration(
          color: const Color(0xffEEEEED),
          borderRadius: BorderRadius.circular(8.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.0),
        child: Row(
          children: [
            ...ShippingType.values.map((e) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      cartModel.changeShippingType(e);
                      setState(() {
                        _shippingType = e;
                      });
                    },
                    child: Container(
                      color: _shippingType == e
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      child: Center(
                        child: Text(
                          e.displayName.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: _shippingType == e
                                      ? Colors.white
                                      : const Color(0xffA3A7A0),
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
