import 'package:flutter/material.dart';
import 'package:flux_extended/store_locator/services/index.dart';
import 'package:fstore/app.dart';
import 'package:fstore/common/config.dart';
import 'package:fstore/common/constants.dart';
import 'package:fstore/generated/l10n.dart';
import 'package:fstore/models/entities/prediction.dart';
import 'package:fstore/modules/dynamic_layout/logo/logo.dart';
import 'package:fstore/screens/common/app_bar_mixin.dart';
import 'package:fstore/widgets/html/index.dart';
import 'package:fstore/widgets/map/autocomplete_search_input.dart';
import 'package:provider/provider.dart';

import '../models/map_model.dart';
import '../models/store.dart';

class StoreLocatorScreen extends StatefulWidget {
  const StoreLocatorScreen({super.key});

  @override
  State<StoreLocatorScreen> createState() => _StoreLocatorScreenState();
}

class _StoreLocatorScreenState extends State<StoreLocatorScreen>
    with AppBarMixin, SingleTickerProviderStateMixin {
  bool _showMap = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    resetText();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapModel>(
        create: (_) => MapModel(),
        // create: (_) => MapModel()..getStores(showAll: true),
        child: Consumer<MapModel>(builder: (context, mapModel, _) {
          final disableMap =
              (isMacOS || isWindow || isFuchsia || mapModel.markers.isEmpty);
          return DefaultTabController(
            length: 2,
            child: renderScaffold(
                secondAppBar: renderAppBar(),
                backgroundColor: Theme.of(context).colorScheme.surface,
                routeName: RouteList.storeLocator,
                child: SafeArea(
                  bottom: true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'HOW WOULD YOU LIKE YOUR MEAL?',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 12, 30, 12),
                        // Margin for spacing around the tab bar
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,

                          // textScaler: const TextScaler.linear(1.3),
                          onTap: (value) {
                            // resetText();
                            // mapModel.showAllStores();
                          },
                          tabs: const [
                            Tab(
                              text: 'Pick-up',
                            ),
                            Tab(text: 'Delivery'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: [
                            /// pick up view
                            Column(
                              children: [
                                TextFieldRow(
                                  mapModel: mapModel,
                                  hintText: 'PICK A LOCATION NEAR YOU',
                                ),
                                UseMyLocationRow(
                                  mapModel: mapModel,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: mapModel.state == MapModelState.loading
                                      ? Center(
                                          child: kLoadingWidget(context),
                                        )
                                      : mapModel.showStores
                                          ? Stack(
                                              children: [
                                                if (!_showMap ||
                                                    mapModel.stores.isEmpty)
                                                  Container(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 30,
                                                      right: 30,
                                                    ),
                                                    child: mapModel
                                                            .stores.isNotEmpty
                                                        ? ListView.builder(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 5,
                                                                    right: 5,
                                                                    bottom: 15),
                                                            itemCount: mapModel
                                                                .stores.length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return StoreItem(
                                                                selectShipType:
                                                                    'Pick up',
                                                                store: mapModel
                                                                        .stores[
                                                                    index],
                                                              );
                                                            })
                                                        : Center(
                                                            child: Text(S
                                                                .of(context)
                                                                .searchEmptyDataMessage),
                                                          ),
                                                  )
                                              ],
                                            )
                                          : Container(),
                                )
                              ],
                            ),

                            /// delivery view
                            Column(
                              children: [
                                TextFieldRow(
                                  mapModel: mapModel,
                                  hintText: 'DELIVER AT YOUR SELECTED LOCATION',
                                ),
                                UseMyLocationRow(
                                  mapModel: mapModel,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: mapModel.state == MapModelState.loading
                                      ? Center(
                                          child: kLoadingWidget(context),
                                        )
                                      : mapModel.showStores
                                          ? Stack(
                                              children: [
                                                if (!_showMap ||
                                                    mapModel.stores.isEmpty)
                                                  Container(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 30,
                                                      right: 30,
                                                    ),
                                                    child: mapModel
                                                            .stores.isNotEmpty
                                                        ? ListView.builder(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 5,
                                                                    right: 5,
                                                                    bottom: 15),
                                                            itemCount: mapModel
                                                                .stores.length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return StoreItem(
                                                                selectShipType:
                                                                    'Delivery',
                                                                store: mapModel
                                                                        .stores[
                                                                    index],
                                                              );
                                                            })
                                                        : Center(
                                                            child: Text(S
                                                                .of(context)
                                                                .searchEmptyDataMessage),
                                                          ),
                                                  )
                                              ],
                                            )
                                          : Container(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child: AutocompleteSearchInput(
                      //     hintText: S.of(context).storeLocatorSearchPlaceholder,
                      //     onChanged: (Prediction prediction) {
                      //       mapModel.updateCurrentLocation(prediction);
                      //     },
                      //     onCancel: () {
                      //       _showMap = false;
                      //       mapModel.showAllStores();
                      //     },
                      //   ),
                      // ),
                      /// map and slider view
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: RadiusSlider(
                      //         maxRadius: mapModel.maxRadius,
                      //         minRadius: mapModel.minRadius,
                      //         onCallBack: (val) =>
                      //             mapModel.getStores(radius: val),
                      //         currentVal: mapModel.radius,
                      //         decoration: BoxDecoration(
                      //           border: Border.all(
                      //               width: 1,
                      //               color: Theme.of(context).primaryColorLight),
                      //           borderRadius: BorderRadius.circular(5.0),
                      //           color: Theme.of(context).cardColor,
                      //         ),
                      //       ),
                      //     ),
                      //     if (!disableMap)
                      //       IconButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               _showMap = !_showMap;
                      //             });
                      //           },
                      //           icon: Icon(
                      //               _showMap
                      //                   ? Icons.list_alt
                      //                   : Icons.map_outlined,
                      //               color: Theme.of(context).primaryColor))
                      //   ],
                      // ),
                      // Expanded(
                      //   child: mapModel.state == MapModelState.loading
                      //       ? Center(
                      //           child: kLoadingWidget(context),
                      //         )
                      //       : Stack(
                      //           children: [
                      //             const StoresMapView(),
                      //             if (!_showMap || mapModel.stores.isEmpty)
                      //               Container(
                      //                 color:
                      //                     Theme.of(context).colorScheme.surface,
                      //                 child: mapModel.stores.isNotEmpty
                      //                     ? ListView.builder(
                      //                         padding: const EdgeInsets.only(
                      //                             left: 15,
                      //                             right: 15,
                      //                             bottom: 15),
                      //                         itemCount: mapModel.stores.length,
                      //                         itemBuilder:
                      //                             (BuildContext context,
                      //                                 int index) {
                      //                           return StoreItem(
                      //                             store: mapModel.stores[index],
                      //                           );
                      //                         })
                      //                     : Center(
                      //                         child: Text(S
                      //                             .of(context)
                      //                             .searchEmptyDataMessage),
                      //                       ),
                      //               )
                      //           ],
                      //         ),
                      // ),
                    ],
                  ),
                )),
          );
        }));
  }

  AppBar? renderAppBar() {
    if (Navigator.canPop(context)) {
      return AppBar(
        elevation: 0.1,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          S.of(context).location,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        leading: Navigator.of(context).canPop()
            ? Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox(),
      );
    }
    return null;
  }
}

class StoreItem extends StatelessWidget {
  final String selectShipType;
  const StoreItem(
      {super.key, required this.store, required this.selectShipType});

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            store.name ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 5),
          HtmlWidget(
            store.address ?? '',
            textStyle:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
          ),
          if (store.phone?.isNotEmpty ?? false)
            StoreContactItem(
                label: S.of(context).phoneNumber, info: store.phone!),
          if (store.mobile?.isNotEmpty ?? false)
            StoreContactItem(label: S.of(context).mobile, info: store.mobile!),
          if (store.fax?.isNotEmpty ?? false)
            StoreContactItem(label: S.of(context).fax, info: store.fax!),
          if (store.email?.isNotEmpty ?? false)
            StoreContactItem(label: S.of(context).email, info: store.email!),
          if (store.website?.isNotEmpty ?? false)
            StoreContactItem(
                label: S.of(context).website, info: store.website!),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                SaveStoreLocation.saveMap({
                  'storeName': store.name.toString(),
                  'type': selectShipType,
                  'storeId': store.id.toString(),
                });
                SaveStoreLocation.saveStore(store);
                getData();
                Navigator.of(App.fluxStoreNavigatorKey.currentContext!)
                    .pushNamedAndRemoveUntil(
                  RouteList.dashboard,
                  (Route<dynamic> route) => false,
                );
                // FluxNavigate.push(
                //   MaterialPageRoute(
                //     builder: (context) => StoreProductsScreen(
                //       store: store,
                //     ),
                //   ),
                //   context: context,
                // );
              },
              child: const Text(
                'Select Store',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

void getData() async {
  storeData = await SaveStoreLocation.getMap();

  print('////////${storeData}');
}

class StoreContactItem extends StatelessWidget {
  const StoreContactItem({super.key, required this.label, required this.info});

  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: RichText(
        text: TextSpan(
          text: label,
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontWeight: FontWeight.bold, fontSize: 11),
          children: <TextSpan>[
            const TextSpan(text: ': '),
            TextSpan(
                text: info,
                style: const TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}

class TextFieldRow extends StatelessWidget {
  final MapModel mapModel;
  final String hintText;
  const TextFieldRow({
    super.key,
    required this.mapModel,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AutocompleteSearchInput(
              hintText: hintText,
              // hintText: S.of(context).storeLocatorSearchPlaceholder,

              onChanged: (Prediction prediction) {
                print('........${prediction.lat}...${prediction.long}');
                mapModel.updateCurrentLocation(prediction);

                mapModel.showStores = true;
              },
              onCancel: () {
                // _showMap = false;
                mapModel.showAllStores();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UseMyLocationRow extends StatelessWidget {
  final MapModel mapModel;

  const UseMyLocationRow({
    super.key,
    required this.mapModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              mapModel.getUserCurrentLocation();
            },
            child: Row(
              children: [
                Icon(
                  Icons.pin_drop,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  'Use my location',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 90,
            height: 45,
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Search'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          )
          // GestureDetector(
          //   onTap: () {
          //     mapModel.showAllStores();
          //   },
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.pin_drop,
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       Text(
          //         'View all stores',
          //         style: TextStyle(
          //           color: Theme.of(context).primaryColor,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class StoresList extends StatelessWidget {
  final MapModel mapModel;

  const StoresList({
    super.key,
    required this.mapModel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: mapModel.state == MapModelState.loading
          ? Center(
              child: kLoadingWidget(context),
            )
          : Stack(
              children: [
                // const StoresMapView(),
                if (mapModel.stores.isEmpty)
                  Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: mapModel.stores.isNotEmpty
                        ? ListView.builder(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            itemCount: mapModel.stores.length,
                            itemBuilder: (BuildContext context, int index) {
                              return StoreItem(
                                selectShipType: 'Pick up',
                                store: mapModel.stores[index],
                              );
                            })
                        : Center(
                            child: Text(S.of(context).searchEmptyDataMessage),
                          ),
                  )
              ],
            ),
    );
  }
}
