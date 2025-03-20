import 'package:flutter/material.dart';

import '../../common/config.dart';
import '../../models/entities/product.dart';
import '../../models/entities/product_component.dart';
import '../../screens/detail/widgets/product_component_widget.dart';

mixin ProductComponentsMixin {
  List<Widget> getProductComponentsWidget({
    required BuildContext context,
    String? lang,
    required Product product,
    required bool isProductInfoLoading,
    Map<String, SelectedProductComponent>? selectedComponents,
    Function? onChanged,
  }) {
    if (product.isCompositeProduct && isProductInfoLoading) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: kLoadingWidget(context),
        )
      ];
    }

    return [
      ProductComponentsWidget(
        product: product,
        lang: lang,
        onChanged: onChanged,
        selectedComponents: selectedComponents,
      )
    ];
  }
}
