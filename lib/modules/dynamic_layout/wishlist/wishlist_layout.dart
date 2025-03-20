import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/constants.dart';
import '../../../generated/l10n.dart';
import '../../../models/product_wish_list_model.dart';
import '../../../modules/dynamic_layout/config/product_config.dart';
import '../../../modules/dynamic_layout/helper/header_view.dart';
import '../../../widgets/product/action_button_mixin.dart';
import '../../../widgets/product/widgets/image.dart';
import '../../../widgets/product/widgets/title.dart';

class WishListLayout extends StatelessWidget with ActionButtonMixin {
  const WishListLayout();
  @override
  Widget build(BuildContext context) {
    final productWishListModel = Provider.of<ProductWishListModel>(context);
    final config = ProductConfig.empty()
      ..showCartIcon = true
      ..enableBottomAddToCart = true
      ..imageBoxfit = 'contain'
      ..showCartButton = false
      ..showCartIcon = false
      ..hidePrice = true
      ..height = 100
      ..showStockStatus = false;

    return ListenableProvider.value(
      value: productWishListModel,
      child: Consumer<ProductWishListModel>(
        builder: (context, value, child) {
          if (value.products.isNotEmpty) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HeaderView(
                        headerText: S.of(context).favorite,
                        showSeeAll: true,
                        callback: () {
                          Navigator.pushNamed(context, RouteList.wishlist);
                        }),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var item in value.products)
                              Column(
                                children: [
                                  ProductImage(
                                    width: 100,
                                    product: item,
                                    config: config,
                                    ratioProductImage: 0.8,
                                    offset: null,
                                    onTapProduct: () => onTapProduct(
                                      context,
                                      product: item,
                                      config: config,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ProductTitle(
                                    product: item,
                                    hide: config.hideTitle,
                                    maxLines: config.titleLine,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
