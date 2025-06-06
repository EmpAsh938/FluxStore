import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux_extended/store_locator/services/index.dart';
import 'package:flux_extended/store_locator/views/store_locator_screen.dart';
import 'package:inspireui/icons/icon_picker.dart' deferred as defer_icon;
import 'package:inspireui/inspireui.dart' show DeferredWidget;
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/theme/colors.dart';
import '../../../models/app_model.dart';
import '../../../models/entities/store/store.dart';
import '../../../widgets/common/flux_image.dart';
import '../../../widgets/multi_site/multi_site_mixin.dart';
import '../config/logo_config.dart';

class LogoIcon extends StatelessWidget {
  final LogoConfig config;
  final Function onTap;
  final MenuIcon? menuIcon;
  final EdgeInsetsDirectional? padding;
  final bool showNumber;
  final int number;

  const LogoIcon({
    super.key,
    required this.config,
    required this.onTap,
    this.menuIcon,
    this.showNumber = false,
    this.number = 0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    getData();
    final boxSize = config.iconSize + config.iconSpreadRadius;
    Widget widget = InkWell(
      onTap: () => onTap.call(),
      child: Container(
        width: boxSize,
        height: boxSize,
        decoration: BoxDecoration(
          color: config.iconBackground ??
              Theme.of(context)
                  .colorScheme
                  .surface
                  .withOpacity(config.iconOpacity),
          borderRadius: BorderRadius.circular(config.iconRadius),
        ),
        child: menuIcon != null
            ? DeferredWidget(
                defer_icon.loadLibrary,
                () => Icon(
                  defer_icon.iconPicker(
                    menuIcon!.name!,
                    menuIcon!.fontFamily ?? 'CupertinoIcons',
                  ),
                  color: config.iconColor ??
                      Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                  size: 25,
                ),
              )
            : Icon(
                Icons.blur_on,
                color: config.iconColor ??
                    Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                size: config.iconSize,
              ),
      ),
    );
    if (showNumber) {
      final boxSizeWithNumber = boxSize + 6;
      widget = SizedBox(
        width: boxSizeWithNumber,
        height: boxSizeWithNumber,
        child: Stack(
          children: [
            Center(child: widget),
            if (number > 0)
              PositionedDirectional(
                end: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    number.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: widget,
    );
  }
}

Map<String, String> storeData = {};

class Logo extends StatefulWidget with MultiSiteMixin {
  final Function() onSearch;
  final Function() onCheckout;
  final Function() onTapDrawerMenu;
  final Function() onTapNotifications;
  final String? logo;
  final LogoConfig config;
  final int totalCart;
  final int notificationCount;

  Logo({
    super.key,
    required this.config,
    required this.onSearch,
    required this.onCheckout,
    required this.onTapDrawerMenu,
    required this.onTapNotifications,
    this.logo,
    this.totalCart = 0,
    this.notificationCount = 0,
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  Widget renderLogo() {
    final logoSize = widget.config.logoSize;

    if (widget.config.image != null) {
      if (widget.config.image!.contains('http')) {
        return SizedBox(
          height: logoSize - 10,
          child: FluxImage(
            imageUrl: widget.config.image!,
            height: logoSize,
            fit: BoxFit.contain,
          ),
        );
      }
      return Image.asset(
        widget.config.image!,
        height: logoSize,
      );
    }

    /// render from config to support dark/light theme
    if (widget.logo != null) {
      return FluxImage(imageUrl: widget.logo!, height: logoSize);
    }

    return const SizedBox();
  }

  Future<String?> getAddress() async {
    try {
      final addressInfo = await SaveStoreLocation.getAddress();

      print(addressInfo);

      if (addressInfo != null && addressInfo['description'] != null) {
        return addressInfo['description'];
      }

      return null; // Explicitly return null if no valid address is found
    } catch (e) {
      print('Error fetching address: $e');
      return null; // Ensure a return value even if an error occurs
    }
  }

  Future<dynamic> getStore() async {
    try {
      final storeInfo = await SaveStoreLocation.getStore();

      if (storeInfo != null) return storeInfo;
      return null;
    } catch (e) {
      print('Error fetching address: $e');
      return null; // Ensure a return value even if an error occurs
    }
  }

  @override
  Widget build(BuildContext context) {
    var enableMultiSite = Configurations.multiSiteConfigs?.isNotEmpty ?? false;
    final appModel = Provider.of<AppModel>(context);

    var multiSiteIcon = appModel.multiSiteConfig?.icon;

    final textConfig = widget.config.textConfig;

    return Container(
      constraints: const BoxConstraints(minHeight: kToolbarHeight),
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0, top: 5.0),
      color: widget.config.color ??
          Theme.of(context)
              .colorScheme
              .surface
              .withOpacity(widget.config.opacity),
      // color: Colors.white,
      child: Row(
        children: [
          if (widget.config.showMenu ?? false)
            LogoIcon(
              menuIcon: widget.config.menuIcon,
              onTap: widget.onTapDrawerMenu,
              config: widget.config,
            ),
          Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: GestureDetector(
                    onTap: () async {
                      if (widget.config.layout == null) return;
                      // config.
                      await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const StoreLocatorScreen()))
                          .then((_) => setState(() {}));
                      ;
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              appModel.darkTheme ? Colors.white : Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 30,
                            ),
                            const SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  storeData.isNotEmpty
                                      ? storeData['type']
                                                  .toString()
                                                  .toLowerCase() ==
                                              'delivery'
                                          ? 'Delivery from'
                                          : 'Pickup at'
                                      : 'Select Pickup or Delivery',
                                  style: TextStyle(
                                      color: appModel.darkTheme
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12),
                                ),
                                if (storeData.isNotEmpty)
                                  Text(
                                    storeData.isNotEmpty
                                        ? storeData['storeName'].toString()
                                        : 'ADDRESS',
                                    style: TextStyle(
                                        color: appModel.darkTheme
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: FutureBuilder<String?>(
                                future: getAddress(), // Call the method here
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const SizedBox.shrink();
                                    // return const CircularProgressIndicator(); // Show loading state
                                  } else if (snapshot.hasError) {
                                    return const Text(
                                      '',
                                      style: TextStyle(color: Colors.red),
                                    );
                                  } else if (!snapshot.hasData ||
                                      snapshot.data == null) {
                                    return const Text(
                                      '',
                                      style: TextStyle(color: Colors.black54),
                                    );
                                  }

                                  return Text(
                                    snapshot.data ?? '',
                                    style: TextStyle(
                                      color: appModel.darkTheme
                                          ? Colors.white
                                          : Colors.black54,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.right,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
                if (widget.config.showLogo) Center(child: renderLogo()),
                if (textConfig != null) ...[
                  if (widget.config.showLogo) const SizedBox(width: 5),
                  Expanded(
                    child: Align(
                      alignment: textConfig.alignment,
                      child: Text(
                        textConfig.text,
                        style: TextStyle(
                          fontSize: textConfig.fontSize,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ],
            ),
          ),
          if (widget.config.showSearch)
            LogoIcon(
              menuIcon: widget.config.searchIcon ?? MenuIcon(name: 'search'),
              onTap: widget.onSearch,
              config: widget.config,
            ),
          // if (config.showBadgeCart)
          //   GestureDetector(
          //     onTap: onCheckout,
          //     behavior: HitTestBehavior.translucent,
          //     child: Container(
          //       margin: const EdgeInsetsDirectional.only(start: 8),
          //       padding: const EdgeInsets.all(8),
          //       decoration: const BoxDecoration(
          //         color: Colors.red,
          //         shape: BoxShape.circle,
          //       ),
          //       alignment: Alignment.center,
          //       child: Text(
          //         totalCart.toString(),
          //         style: const TextStyle(
          //           color: Colors.white,
          //           fontSize: 14,
          //           height: 1.2,
          //         ),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // if (config.showCart)
          //   LogoIcon(
          //     padding: const EdgeInsetsDirectional.only(start: 8),
          //     menuIcon: config.cartIcon ?? MenuIcon(name: 'bag'),
          //     onTap: onCheckout,
          //     config: config,
          //     showNumber: true,
          //     number: totalCart,
          //   ),
          // if (config.showNotification)
          //   LogoIcon(
          //     padding: const EdgeInsetsDirectional.only(start: 8),
          //     menuIcon: config.notificationIcon ?? MenuIcon(name: 'bell'),
          //     onTap: onTapNotifications,
          //     config: config,
          //     showNumber: true,
          //     number: notificationCount,
          //   ),
          // if (enableMultiSite)
          //   Expanded(
          //     child: Padding(
          //       padding: const EdgeInsetsDirectional.only(start: 8),
          //       child: GestureDetector(
          //         onTap: () => showMultiSiteSelection(context),
          //         child: multiSiteIcon?.isEmpty ?? true
          //             ? const Icon(CupertinoIcons.globe)
          //             : FluxImage(
          //                 imageUrl: multiSiteIcon!,
          //                 width: 25,
          //                 height: 20,
          //                 fit: BoxFit.cover,
          //               ),
          //       ),
          //     ),
          //   ),
          if (!enableMultiSite &&
              !widget.config.showSearch &&
              !widget.config.showCart &&
              !widget.config.showBadgeCart &&
              !widget.config.showNotification &&
              widget.config.useSpacerWhenDisableAllItem)
            const Spacer(),
        ],
      ),
    );
  }
}

void getData() async {
  storeData = await SaveStoreLocation.getMap();

  print('////////${storeData}');
}
