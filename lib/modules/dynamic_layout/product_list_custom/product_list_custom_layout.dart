import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/constants.dart';
import '../../../services/services.dart';
import '../../../widgets/product/product_food_view.dart';
import '../config/index.dart';
import '../config/product_list_custom/product_list_custom_config.dart';
import 'product_list_custom_model.dart';

class ProductListCustomLayout extends StatelessWidget {
  const ProductListCustomLayout({super.key, required this.config});
  final ProductListCustomConfig config;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductListCustomModel>(
      create: (_) => ProductListCustomModel(api: Services().api),
      child: _ProductListCustomLayout(
        config: config,
        key: key,
      ),
    );
  }
}

class _ProductListCustomLayout extends StatefulWidget {
  const _ProductListCustomLayout({
    super.key,
    required this.config,
  });

  final ProductListCustomConfig config;

  @override
  State<_ProductListCustomLayout> createState() =>
      __ProductListCustomLayoutState();
}

class __ProductListCustomLayoutState extends State<_ProductListCustomLayout> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductListCustomModel>(context, listen: false)
          .fetchListProduct(widget.config.productIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color? bgColor;
    if (widget.config.backgroundColor?.isNotEmpty ?? false) {
      bgColor = HexColor(widget.config.backgroundColor);
    }

    final widthScreen = MediaQuery.sizeOf(context).width;

    return Consumer<ProductListCustomModel>(
      builder: (context, model, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15, top: 5),
              child: Text(
                widget.config.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Wrap(
              // shrinkWrap: true,
              // padding: const EdgeInsets.symmetric(horizontal: 16),
              // physics: const NeverScrollableScrollPhysics(),
              // itemCount: model.listProducts.length,
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   childAspectRatio: (MediaQuery.sizeOf(context).width / 2) /
              //       (MediaQuery.sizeOf(context).width / 2 + 72),
              //   mainAxisSpacing: 0,
              // ),
              children: List.generate(model.listProducts.length, (index) {
                final item = model.listProducts[index];
                return SizedBox(
                  width: widthScreen / 2 - 16,
                  height: 230,
                  child: ProductFoodView(
                    item: item
                      ..ratingCount = 5
                      ..averageRating = 5,
                    width: 180,
                    config: ProductConfig.empty()
                      ..imageBoxfit = 'contain'
                      ..borderRadius = 18
                      ..showHeart = true
                      ..vMargin = 0.0
                      ..vPadding = 0.0
                      ..hMargin = 5
                      ..backgroundColor = bgColor
                      ..imageRatio = 0.6,
                  ),
                );
              }),
              // itemBuilder: (_, index) {
              //
              // },
            ),
          ],
        );
      },
    );
  }
}
