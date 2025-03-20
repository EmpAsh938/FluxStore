import 'package:flutter/material.dart';

import '../../../../common/constants.dart';
import '../../config/app_config.dart';
import '../../config/tab_bar_config.dart';
import '../tabbar_icon.dart';
import 'tab_indicator_decoration.dart';

class TabbarRadius extends StatefulWidget {
  const TabbarRadius({
    super.key,
    required this.tabData,
    required this.totalCart,
    required this.selectedIndex,
    required this.tabBarConfig,
    required this.onTap,
    required this.tabController,
  });

  final List<TabBarMenuConfig> tabData;
  final TabController tabController;
  final int totalCart;
  final int selectedIndex;
  final TabBarConfig tabBarConfig;
  final Function(int) onTap;

  @override
  State<TabbarRadius> createState() => _TabbarRadiusState();
}

class _TabbarRadiusState extends State<TabbarRadius> {
  @override
  Widget build(BuildContext context) {
    final position = widget.tabBarConfig.tabBarFloating.position;
    final floatingIndex = (position != null && position < listTabData.length)
        ? position
        : (listTabData.length / 2).floor();

    const heightBottomBar = kBottomNavigationBarHeight + 20;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8).copyWith(bottom: 20),
            height: heightBottomBar - 16,
            child: Container(
              decoration: TabIndicatorDecoration(
                color: const Color(0xffEEEEED),
              ),
            ),
          ),
          SizedBox(
            height: heightBottomBar,
            child: ListenableBuilder(
              listenable: widget.tabController,
              builder: (_, __) {
                return Row(
                  children: List.generate(
                    widget.tabData.length,
                    (index) => Expanded(
                      child: IconTheme(
                        data: IconThemeData(
                          color: index == widget.tabController.index
                              ? Theme.of(context).primaryColor
                              : const Color(0xffA3A7A0),
                        ),
                        child: _renderTabbar(
                            widget.tabData[index], index, floatingIndex),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<TabBarMenuConfig> get listTabData => widget.tabData;

  Widget _renderTabbar(TabBarMenuConfig tabData, int index, int floatingIndex) {
    final isMiddle = index == (listTabData.length ~/ 2);

    if (isMiddle) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: IconTheme(
            data: const IconThemeData(color: Colors.black),
            child: GestureDetector(
              onTap: () => widget.onTap(index),
              behavior: HitTestBehavior.translucent,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .primaryColor, //const Color(0xffB5DC62),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: TabBarIcon(
                          key: Key('TabBarIcon-$index'),
                          item: listTabData[index],
                          totalCart: 0,
                          isActive: index == widget.tabController.index,
                          isEmptySpace: widget.tabBarConfig.showFloating &&
                              index == floatingIndex,
                          config: widget.tabBarConfig.copyWith(
                            iconSize: 45,
                            colorActiveIcon: HexColor('FFFFFF'),
                          ),
                        ),
                      ),
                      if (widget.totalCart > 0)
                        Positioned.directional(
                          top: 0,
                          end: 0,
                          textDirection: Directionality.of(context),
                          child: Container(
                            padding: const EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                  color: Colors.orange[700],
                                  borderRadius: BorderRadius.circular(20)),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Center(
                                  child: Text(
                                    widget.totalCart.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return listTabData[index].visible == false ||
            listTabData[index].groupLayout == true
        ? const SizedBox()
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: GestureDetector(
              onTap: () => widget.onTap(index),
              behavior: HitTestBehavior.translucent,
              child: TabBarIcon(
                key: Key('TabBarIcon-$index'),
                item: listTabData[index],
                totalCart: widget.totalCart,
                isActive:
                    widget.tabBarConfig.showFloating && index == floatingIndex,
                isEmptySpace:
                    widget.tabBarConfig.showFloating && index == floatingIndex,
                config: widget.tabBarConfig,
              ),
            ),
          );
  }
}
