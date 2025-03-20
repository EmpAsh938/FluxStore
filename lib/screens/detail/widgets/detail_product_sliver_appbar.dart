import 'package:flutter/material.dart';
import 'package:fstore/screens/detail/widgets/product_title/product_title_widget.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/tools/image_resize.dart';
import '../../../common/tools/image_tools.dart';
import '../../../models/index.dart';
import '../../../widgets/common/flux_image.dart';
import '../../../widgets/html/index.dart';
import '../../../widgets/product/widgets/heart_button.dart';
import '../product_detail_screen.dart';
import '../widgets/product_title/product_title_state_ui.dart';

import 'product_image_list.dart';
import 'product_image_slider.dart';

class DetailProductSliverAppBar extends StatelessWidget {
  const DetailProductSliverAppBar({
    required this.product,
    required this.isLoading,
    required this.onChangeImage,
  });

  final Product product;
  final bool isLoading;
  final void Function(int) onChangeImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final numProducts =
        Provider.of<CartModel>(context).productsInCart.keys.length;
    final totalCartQuantity = Provider.of<CartModel>(context).totalCartQuantity;
    print("kProductDetail.height ${kProductDetail.height}");
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 1.0,
      expandedHeight: kIsWeb ? 0 : height * 0.3,
      pinned: true,
      floating: false,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.surfaceBright,
          ),
          onPressed: () {
            context.read<ProductModel>().clearProductVariations();
            Navigator.pop(context);
          },
        ),
      ),
      actions: <Widget>[
        // Padding(
        //   padding: const EdgeInsets.all(12),
        //   child: CircleAvatar(
        //     backgroundColor:
        //         Theme.of(context).primaryColorLight.withOpacity(0.7),
        //     child: IconButton(
        //       icon: const Icon(Icons.more_vert, size: 19),
        //       color: Theme.of(context).primaryColor,
        //       onPressed: () => ProductDetailScreen.showMenu(
        //         context,
        //         product,
        //         isLoading: isLoading,
        //       ),
        //     ),
        //   ),
        // ),
        /// to be used
        // Padding(
        //   padding: const EdgeInsets.all(6),
        //   child: SizedBox(
        //     width: 100,
        //     height: 30,
        //     child: Card(
        //       color: Colors.white,
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Column(
        //               children: [
        //                 Text(
        //                   "My Bag",
        //                   style: TextStyle(
        //                     color: Colors.red,
        //                     fontWeight: FontWeight.w900,
        //                     fontSize: 8.0,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             CircleAvatar(
        //               backgroundColor: Theme.of(context).primaryColor,
        //               child: Text(
        //                 "8",
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.w900,
        //                   fontSize: 12.0,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
      flexibleSpace: Builder(
        builder: (context) {
          print(
              "kProductDetail.productImageLayout.isList ${kProductDetail.productImageLayout.isList}");
          return kIsWeb
              ? const SizedBox()
              : kProductDetail.productImageLayout.isList
                  ? ProductImageList(
                      product: product,
                      onChange: (index) {
                        onChangeImage(index);
                      },
                      height: height * kProductDetail.height * 0.8,
                    )
                  : Stack(
                      children: [
                        Positioned(
                          top: 50,
                          left: 50,
                          right: 50,
                          child: FluxImage(
                            imageUrl: context.select(
                                  (AppModel userModel) => userModel.themeConfig.logo,
                            ),
                            width: 40,
                            height:40,
                          ),
                        ),
                        // Positioned(
                        //   top: 50,
                        //   left: 50,
                        //   right: 50,
                        //   child: renderCornerCart(),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 60, bottom: 20, left: 100, right: 100),
                          child: ProductImageSlider(
                            product: product,
                            onChange: (index) {
                              onChangeImage(index);
                            },
                          ),
                        ),
                        Positioned(
                          top: 90,
                          left: 150,
                          right: 50,
                          child: HtmlWidget(
                            product.name ?? '',
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(
                                    fontSizeFactor: 0.9, color: Colors.white),
                          ),
                        ),
                        if (isLoading != true)
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: HeartButton(
                              product: product,
                              size: 20.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                      ],
                    );
        },
      ),
    );
  }
}
