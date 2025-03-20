import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fstore/generated/l10n.dart';
import 'package:fstore/models/cart/cart_base.dart';
import 'package:fstore/models/entities/shipping_type.dart';
import 'package:fstore/widgets/html/index.dart';
import 'package:provider/provider.dart';

import '../models/store.dart';
import '../services/index.dart';

class SelectHakkaLocation extends StatefulWidget {
  const SelectHakkaLocation({super.key});

  @override
  State<SelectHakkaLocation> createState() => _SelectHakkaLocationState();
}

class _SelectHakkaLocationState extends State<SelectHakkaLocation> {
  // final _services = StoreLocatorServices();
  // List<Store> _stores = [];
  late ShippingType _shippingType =
      Provider.of<CartModel>(context, listen: false).shippingType;
  // late Store? _selectedStore =
  //     Provider.of<CartModel>(context, listen: false).selectedStore;

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   _services.getStores(showAll: true).then((stores) {
    //     setState(() {
    //       _stores = stores;
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    // if (_stores.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        // renderStoreInput(),
        // if (_selectedStore != null)
        //   Container(
        //     width: double.infinity,
        //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        //     margin: const EdgeInsets.symmetric(vertical: 15),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(4.0),
        //       color: const Color(0xffEEEEED),
        //     ),
        //     child: (_shippingType == ShippingType.pickup)
        //         ? Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 '${S.of(context).addressToPickup} :',
        //                 style: Theme.of(context)
        //                     .textTheme
        //                     .titleLarge
        //                     ?.copyWith(fontWeight: FontWeight.bold),
        //               ),
        //               const SizedBox(height: 10),
        //               HtmlWidget(_selectedStore?.shippingAddress ?? ''),
        //             ],
        //           )
        //         : Text(
        //             S.of(context).comingSoon,
        //             style: Theme.of(context)
        //                 .textTheme
        //                 .titleLarge
        //                 ?.copyWith(fontWeight: FontWeight.bold),
        //           ),
        //   ),
        // const SizedBox(height: 15),
        Text(S.of(context).pickupOrDelivery,
            style: Theme.of(context).textTheme.titleMedium),
        ...ShippingType.values.map((e) => Row(
              children: [
                Radio<ShippingType>(
                  value: e,
                  groupValue: _shippingType,
                  onChanged: (ShippingType? value) {
                    setState(() {
                      _shippingType = value ?? ShippingType.pickup;
                    });
                    Provider.of<CartModel>(context, listen: false)
                        .changeShippingType(_shippingType);
                  },
                ),
                Text(e.displayName)
              ],
            )),
      ],
    );
  }

  // Widget renderStoreInput() {
  //   var items = <DropdownMenuItem>[];
  //   for (var item in _stores) {
  //     items.add(
  //       DropdownMenuItem(
  //         value: item.slug,
  //         child: Text(item.name!),
  //       ),
  //     );
  //   }

  //   return DropdownButtonFormField<dynamic>(
  //     items: items,
  //     value: _selectedStore?.slug,
  //     validator: (val) {
  //       return null;
  //     },
  //     onChanged: (dynamic val) async {
  //       setState(() {
  //         _selectedStore = _stores.firstWhereOrNull((e) => e.slug == val);
  //       });
  //       Provider.of<CartModel>(context, listen: false)
  //           .selectStore(_selectedStore);
  //     },
  //     isExpanded: true,
  //     itemHeight: 70,
  //     hint: Text(S.of(context).selectHakkaLocation),
  //   );
  // }
}
