import 'package:flutter/material.dart';
import 'package:flux_extended/store_locator/models/product_model.dart' as p;
import 'package:fstore/common/config.dart';
import 'package:provider/provider.dart';

import '../../../models/index.dart' show Product, ProductModel;
import '../../../screens/common/app_bar_mixin.dart';
import '../../../widgets/common/background_color_widget.dart';
import '../../../widgets/product/product_simple_view.dart';
import '../config/product_config.dart';
import '../helper/header_view.dart';
import 'future_builder.dart';

class SimpleVerticalProductList extends StatelessWidget {
  final ProductConfig config;

  const SimpleVerticalProductList({required this.config, super.key});

  Widget renderProductListWidgets(List<Product> products) {
    print("prodcuts length is ${products.length}");
    for (var item in products) {
      print("product item is $item");
    }
    return Column(
      children: [
        const SizedBox(width: 10.0),
        for (var item in products)
          ProductSimpleView(
            item: item,
            type: SimpleType.priceOnTheRight,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProductFutureBuilder(
      config: config,
      waiting: Column(
        children: <Widget>[
          HeaderView(
            headerText: config.name ?? '',
            showSeeAll: true,
            callback: () => ProductModel.showList(
              config: config.jsonData,
              context: context,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                for (var i = 0; i < 3; i++)
                  ProductSimpleView(
                    item: Product.empty(i.toString()),
                    type: SimpleType.priceOnTheRight,
                  ),
              ],
            ),
          )
        ],
      ),
      child: ({maxWidth, maxHeight, products}) {
        print("prodcuts count is ${products.length}");
        print("config  ${config.jsonData}");
        return BackgroundColorWidget(
          enable: config.enableBackground,
          child: Column(
            children: <Widget>[
              // HeaderView(
              //   headerText: config.name ?? '',
              //   showSeeAll: true,
              //   callback: () => ProductModel.showList(
              //     config: config.jsonData,
              //     products: products,
              //     context: context,
              //   ),
              // ),
              renderProductListWidgets(products)
            ],
          ),
        );
      },
    );
  }
}

class SimpleStoreList extends StatefulWidget {
  final storeId;

  const SimpleStoreList({super.key, this.storeId});

  @override
  State<SimpleStoreList> createState() => _SimpleStoreListState();
}

class _SimpleStoreListState extends State<SimpleStoreList> with AppBarMixin {
  Widget renderListWidgets(List<Product> products) {
    return Column(
      children: [
        const SizedBox(width: 10.0),
        for (var item in products)
          ProductSimpleView(
            item: item,
            type: SimpleType.priceOnTheRight,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<p.ProductModel>(
      create: (_) => p.ProductModel()..refreshProducts(widget.storeId ?? ''),
      child: Consumer<p.ProductModel>(builder: (context, model, _) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: model.isFetching
                ? Center(
                    child: kLoadingWidget(context),
                  )
                : renderListWidgets(model.productsList));
      }),
    );
  }
}
