import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inspireui/icons/icon_picker.dart' deferred as defer_icon;
import 'package:inspireui/inspireui.dart' show DeferredWidget;
import 'package:provider/provider.dart';

import '../../../models/index.dart';
import '../../../widgets/common/flux_image.dart';
import '../config/app_config.dart';
import '../config/tab_bar_config.dart';
import '../helper/helper.dart';

const _kMaxNum = 99;

class TabBarIcon extends StatelessWidget {
  final TabBarMenuConfig item;
  final int totalCart;
  final bool isEmptySpace;
  final bool isActive;
  final bool isHorizontal;
  final TabBarConfig config;

  const TabBarIcon({
    required Key key,
    required this.item,
    required this.totalCart,
    required this.isEmptySpace,
    required this.isActive,
    required this.config,
    this.isHorizontal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context, listen: false);

    if (isEmptySpace) {
      return const SizedBox(
        width: 60,
        height: 2,
      );
    }

    Widget icon = Builder(
      builder: (context) {
        var iconColor = isActive
            ? const Color(0xffcc1c24)
            : appModel.darkTheme
                ? Colors.white
                : Colors.black;

        if (item.icon.isEmpty) {
          return Icon(
            Icons.question_mark,
            color: iconColor,
            size: config.iconSize,
          );
        }

        var imagePath = '';

        switch (item.label) {
          case 'Home':
            // return const Image(image: AssetImage('assets/icons/nav/Home.png'));
            imagePath = 'assets/icons/nav/Home.png';
            break;
          case 'Location':
            imagePath = 'assets/icons/nav/location-icon.png';
            break;
          // return const Image(

          //     image: AssetImage('assets/icons/nav/location-icon.png'));
          case 'Menu':
            imagePath = 'assets/icons/nav/Menu.png';
            break;
          // return const Image(image: AssetImage('assets/icons/nav/Menu.png'));
          case 'FAVOURITS':
            imagePath = 'assets/icons/nav/rewards.png';
            break;
          // return const Image(
          //     image: AssetImage('assets/icons/nav/rewards.png'));
          case 'Profile':
            imagePath = 'assets/icons/nav/Profile.png';
            break;
          // return const Image(
          //     image: AssetImage('assets/icons/nav/Profile.png'));
          default:
            return Icon(
              Icons.question_mark,
              color: iconColor,
              size: config.iconSize,
            );
        }

        var isImage = imagePath.contains('/');
        return isImage
            ? FluxImage(
                imageUrl: imagePath,
                color: item.showOriginalColor ? null : iconColor,
                width: config.iconSize,
                useExtendedImage: false,
              )
            : DeferredWidget(
                defer_icon.loadLibrary,
                () => Icon(
                  defer_icon.iconPicker(item.icon, item.fontFamily),
                  color: iconColor,
                  size: config.iconSize,
                ),
              );
      },
    );

    if (item.layout == 'cart') {
      icon = IconCart(icon: icon, totalCart: totalCart, config: config);
    }

    if (isHorizontal) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 12, 0),
            child: icon,
          ),
          Text(
            item.label == 'FAVOURITS'
                ? 'REWARDS'
                : item.label.toString().toUpperCase(),
            softWrap: false,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      );
    }

    return Tab(
      text: item.label == 'FAVOURITS' ? 'Rewards' : item.label,
      iconMargin: EdgeInsets.zero,
      icon: icon,
    );
  }
}

class IconCart extends StatelessWidget {
  const IconCart({
    super.key,
    required this.icon,
    required this.totalCart,
    required this.config,
  });

  final Widget icon;
  final int totalCart;
  final TabBarConfig config;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:
              totalCart > 0 ? const EdgeInsets.only(top: 5, right: 5) : null,
          child: icon,
        ),
        if (totalCart > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 16,
              height: 16,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: config.colorCart ?? Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      min(totalCart, _kMaxNum).toString() +
                          (totalCart > _kMaxNum ? '+' : ''),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Layout.isDisplayDesktop(context) ? 14 : 12,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
