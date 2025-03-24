import 'package:flutter/material.dart';
import 'package:flux_extended/store_locator/services/index.dart';
import 'package:provider/provider.dart';
import 'package:quiver/strings.dart';

import '../../../common/theme/colors.dart';
import '../../../common/tools/price_tools.dart';
import '../../../models/cart/cart_base.dart';
import '../../../models/entities/shipping_method.dart';
import '../../../models/entities/shipping_type.dart';
import '../../../services/services.dart';
import '../../../widgets/common/index.dart';

class SelectionShippingMethodWidget extends StatefulWidget {
  const SelectionShippingMethodWidget({
    super.key,
    this.index,
    this.valueSelecled,
    this.onSelected,
    required this.shippingMethod,
    this.useDesktopStyle = false,
    this.isLast = false,
    this.isSelected = false,
    this.enable = true,
  });

  final int? index;
  final int? valueSelecled;
  final bool useDesktopStyle;
  final bool isLast;
  final bool enable;
  final bool isSelected;
  final void Function(int?)? onSelected;
  final ShippingMethod shippingMethod;

  @override
  State<SelectionShippingMethodWidget> createState() =>
      _SelectionShippingMethodWidgetState();
}

class _SelectionShippingMethodWidgetState
    extends State<SelectionShippingMethodWidget> {
  double wieatCost = 0.0;

  @override
  void initState() {
    super.initState();
    fetchCost();
  }

  void fetchCost() async {
    try {
      final deliveryCost = await SaveStoreLocation.getCost();
      setState(() {
        wieatCost = deliveryCost;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context, listen: false);
    final theme = Theme.of(context);
    // print("SHIPPINGGGGGGG ${shippingMethod.toJson()}");
    // if (cartModel.shippingType != ShippingType.pickup &&
    //     shippingMethod.id != '1') return SizedBox.shrink();

    /// Title
    final titleWidget = Services().widget.renderShippingPaymentTitle(
          context,
          widget.shippingMethod.title!,
          isDesktop: widget.useDesktopStyle,
        );

    /// Price
    /// Price
    Widget priceWidget = const SizedBox();
    double shippingCost = widget.shippingMethod.cost ?? 0.0;
    double shippingTax = widget.shippingMethod.shippingTax ?? 0.0;

    if (shippingCost > 0.0 || !isNotBlank(widget.shippingMethod.classCost)) {
      priceWidget = Text(
        PriceTools.getCurrencyFormatted(
            shippingCost + (widget.shippingMethod.shippingTax ?? 0) + wieatCost,
            cartModel.currencyRates,
            currency: cartModel.currencyCode)!,
        style: const TextStyle(
          fontSize: 14,
          color: kGrey400,
        ),
      );
    }

    /// classCost
    Widget classCost = const SizedBox();
    if (widget.shippingMethod.cost == 0.0 &&
        isNotBlank(widget.shippingMethod.classCost)) {
      classCost = Text(
        // widget.shippingMethod.id == '3' ?
        widget.shippingMethod.classCost ?? '',
        style: const TextStyle(fontSize: 14, color: kGrey400),
      );
    }

    return GestureDetector(
      onTap: () => widget.onSelected?.call(widget.index),
      behavior: HitTestBehavior.translucent,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: widget.useDesktopStyle
                  ? theme.colorScheme.surface
                  : (widget.isSelected
                      ? theme.primaryColorLight
                      : Colors.transparent),
              borderRadius:
                  widget.useDesktopStyle ? BorderRadius.circular(10) : null,
              border: widget.useDesktopStyle
                  ? Border.all(
                      color: widget.isSelected
                          ? theme.primaryColor
                          : theme.colorScheme.secondary.withOpacity(0.2),
                      width: 2,
                    )
                  : null,
            ),
            margin: widget.useDesktopStyle
                ? const EdgeInsets.only(bottom: 16)
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: <Widget>[
                  if (widget.index != null)
                    Radio(
                      value: widget.index,
                      groupValue: widget.valueSelecled,
                      onChanged: (value) => widget.onSelected?.call(value),
                    ),
                  const SizedBox(width: 10),
                  if (widget.useDesktopStyle) ...[
                    const FluxImage(imageUrl: 'assets/icons/payment/truck.svg'),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        titleWidget,
                        classCost,
                      ],
                    ),
                    const Spacer(),
                    priceWidget
                  ] else
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          titleWidget,
                          const SizedBox(height: 5),
                          priceWidget,
                          classCost
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
          if (widget.useDesktopStyle == false)
            widget.isLast ? const SizedBox() : const Divider(height: 1)
        ],
      ),
    );
  }
}
