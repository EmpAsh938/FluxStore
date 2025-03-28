import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fstore/common/constants.dart';
import 'package:fstore/generated/l10n.dart';
import 'package:fstore/models/cart/cart_base.dart';
import 'package:fstore/models/entities/address.dart';
import 'package:fstore/models/entities/prediction.dart';
import 'package:fstore/models/entities/shipping_type.dart';
import 'package:fstore/models/user_model.dart';
import 'package:fstore/routes/flux_navigate.dart';
import 'package:fstore/widgets/html/index.dart';
import 'package:fstore/widgets/map/autocomplete_search_input.dart';
import 'package:provider/provider.dart';

import '../models/map_model.dart';
import '../models/store.dart';
import '../services/index.dart';

class SelectHakkaLocation extends StatefulWidget {
  const SelectHakkaLocation({super.key});

  @override
  State<SelectHakkaLocation> createState() => _SelectHakkaLocationState();
}

class _SelectHakkaLocationState extends State<SelectHakkaLocation> {
  final _services = StoreLocatorServices();
  List<Store> _stores = [];
  late ShippingType _shippingType =
      Provider.of<CartModel>(context, listen: false).shippingType;
  Store? _selectedStore;
  // Provider.of<CartModel>(context, listen: false).selectedStore;

  Address? address;

  String userAddress = '';

  Future<void> setStore() async {
    try {
      final store = await SaveStoreLocation.getStore();
      final addressInfo = await SaveStoreLocation.getAddress();

      if (store != null && mounted) {
        setState(() {
          _selectedStore = store;
        });
      }

      if (addressInfo != null && addressInfo['description'] != null) {
        setState(() {
          userAddress = addressInfo['description'] ?? '';
        });
      }
    } catch (e) {
      print('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    setStore();
    Future.delayed(Duration.zero, () {
      _services.getStores(showAll: true).then((stores) {
        setState(() {
          _stores = stores;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("STORRRRRRE ${_selectedStore!.toJson()}");
    if (_stores.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const Text(
          'Store',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 20 / 14,
          ),
        ),
        renderStoreInput(),
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
        const SizedBox(height: 15),
        if (_shippingType == ShippingType.delivery)
          // TextFormField(
          //   initialValue: _selectedStore!.address,
          //   readOnly: false,
          // ),
          const Text(
            'Delivery Address',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 20 / 14,
            ),
          ),
        if (_shippingType == ShippingType.delivery)
          TextFormField(
            initialValue: userAddress,
            readOnly: true,
            decoration: InputDecoration(
              // labelText: currentFieldType.getTitle(context),
              border: const OutlineInputBorder(),
              // floatingLabelAlignment: FloatingLabelAlignment.start,
              fillColor: Theme.of(context).colorScheme.surface,
              filled: true,
            ),
          ),
        // AutocompleteSearchInput(
        //   hintText: userAddress == '' ? 'Search' : userAddress,
        //   onChanged: (Prediction prediction) {
        //     // mapModel.updateCurrentLocation(prediction);
        //     // prediction.

        //     final cartModel = Provider.of<CartModel>(context, listen: false);
        //     final selectedAddress = Address(
        //       street: prediction.description!,
        //       latitude: prediction.lat,
        //       longitude: prediction.long,
        //     );
        //     cartModel.setAddress(selectedAddress);
        //     // context.read<MapModel>().updateCurrentLocation(prediction);
        //     SaveStoreLocation.saveAddress({
        //       'latitude': prediction.lat!,
        //       'longitude': prediction.long!,
        //       'description': prediction.description!,
        //     });
        //     // mapModel.updateCurrentLocation(prediction);
        //   },
        //   // );
        //   // },
        // ),

        const SizedBox(height: 15),
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

        ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Color(0xffcc1c24)),
            ),
            onPressed: () {
              FluxNavigate.pushNamed(RouteList.storeLocator, context: context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Update Shipping Details'),
            )),
      ],
    );
  }

  Widget renderStoreInput() {
    return TextFormField(
      initialValue: _selectedStore!.name,
      readOnly: true,
      decoration: InputDecoration(
        // labelText: currentFieldType.getTitle(context),
        border: const OutlineInputBorder(),
        // floatingLabelAlignment: FloatingLabelAlignment.start,
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
      ),
    );
    var items = <DropdownMenuItem>[];
    for (var item in _stores) {
      if (_selectedStore != null) {
        items.add(DropdownMenuItem(
            value: _selectedStore!.slug, child: Text(_selectedStore!.name!)));
        break;
      }
      items.add(
        DropdownMenuItem(
          value: item.slug,
          child: Text(item.name!),
        ),
      );
    }

    return DropdownButtonFormField<dynamic>(
      items: items,
      value: _selectedStore?.slug,
      validator: (val) {
        return null;
      },
      onChanged: (dynamic val) async {
        if (_selectedStore != null) return;
        setState(() {
          _selectedStore = _stores.firstWhereOrNull((e) => e.slug == val);
        });
        Provider.of<CartModel>(context, listen: false)
            .selectStore(_selectedStore);
      },
      isExpanded: true,
      itemHeight: 70,
      hint: Text(S.of(context).selectHakkaLocation),
    );
  }
}
