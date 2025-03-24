import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../models/app_model.dart';
import '../../../models/entities/product.dart';
import '../../../models/entities/product_component.dart';
import '../../../models/entities/product_variation.dart';
import 'product_component_item.dart';

class ProductComponentsWidget extends StatefulWidget {
  const ProductComponentsWidget({
    super.key,
    this.lang,
    required this.product,
    this.selectedComponents,
    this.onChanged,
  });

  final String? lang;
  final Product product;
  final Map<String, SelectedProductComponent>? selectedComponents;
  final Function? onChanged;

  @override
  State<ProductComponentsWidget> createState() =>
      _ProductComponentsWidgetState();
}

class _ProductComponentsWidgetState extends State<ProductComponentsWidget> {
  @override
  Widget build(BuildContext context) {
    var cpPerItemPricing = widget.product.cpPerItemPricing == true;
    final model = Provider.of<AppModel>(context);
    final rates = model.currencyRate;

    if (widget.product.isCompositeProduct &&
        (widget.product.components?.isNotEmpty ?? false)) {
      final listWidget = <Widget>[];
      widget.product.components?.forEach((component) {
        listWidget.add(SelectionCompositeProductWidget(
          component: component,
          selectedComponents: widget.selectedComponents,
          onChanged: widget.onChanged,
          cpPerItemPricing: cpPerItemPricing,
          currencyRate: rates,
        ));
      });

      return Column(children: listWidget);
    }
    return const SizedBox();
  }
}

class SelectionCompositeProductWidget extends StatefulWidget {
  const SelectionCompositeProductWidget({
    super.key,
    this.selectedComponents,
    required this.component,
    this.onChanged,
    required this.cpPerItemPricing,
    required this.currencyRate,
  });
  final bool cpPerItemPricing;
  final Map<String, dynamic> currencyRate;
  final Map<String, SelectedProductComponent>? selectedComponents;
  final ProductComponent component;
  final Function? onChanged;

  @override
  State<SelectionCompositeProductWidget> createState() =>
      _SelectionCompositeProductWidgetState();
}

class _SelectionCompositeProductWidgetState
    extends State<SelectionCompositeProductWidget> {
  Map<String, SelectedProductComponent>? _selectedComponents;
  String get _componentId => _component.id ?? '';
  ProductComponent get _component => widget.component;

  bool get _isSelected =>
      _selectedComponents?.containsKey(_component.id) ?? false;

  @override
  void didUpdateWidget(covariant SelectionCompositeProductWidget oldWidget) {
    if (oldWidget.selectedComponents != widget.selectedComponents) {
      _selectedComponents = widget.selectedComponents;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final listWidget = <Widget>[];
    final products = _component.products;
    var selectedComponent = _selectedComponents?[_component.id];
    print('PRODUCTSSSSS ${products!.first.toJson()}');

    if (_isSelected ||
        (_selectedComponents != null && _selectedComponents!.isNotEmpty)) {
      // final itemSelected = _selectedComponents![_componentId]!;
      // print('SELECTEDDDDDDDD ${widget.selectedComponents}');
      // products?.forEach(
      //   (product) {
      //     if (product == itemSelected.product) {
      //       listWidget.add(ProductComponentItem(
      //           product: product,
      //           isSelected: true,
      //           cpPerItemPricing: widget.cpPerItemPricing,
      //           onSelected: (ProductVariation? variant) {
      //             // if (_selectedComponents != null) {
      //             //   _selectedComponents!
      //             //       .removeWhere((key, value) => key == _component.id);
      //             // }
      //             widget.onChanged?.call(_selectedComponents);
      //           },
      //           onChanged: (SelectedProductComponent selectedComponent) {},
      //           selectedComponent: _selectedComponents?[_component.id]));
      //       listWidget.add(const SizedBox(height: 5));
      //     }
      //   },
      // );
      _selectedComponents?.forEach((key, selectedComponent) {
        products?.forEach((product) {
          if (product == selectedComponent.product) {
            listWidget.add(ProductComponentItem(
              product: product,
              isSelected: true,
              cpPerItemPricing: widget.cpPerItemPricing,
              onSelected: (ProductVariation? variant) {
                if (_selectedComponents != null) {
                  _selectedComponents!
                      .removeWhere((key, value) => key == _component.id);
                }
                widget.onChanged?.call(_selectedComponents);
              },
              onChanged: (SelectedProductComponent selectedComponent) {},
              selectedComponent: selectedComponent,
            ));
            listWidget.add(const SizedBox(height: 5));
          }
        });
      });
    }

    if (!_isSelected ||
        selectedComponent!.product.categoryId == '98' ||
        selectedComponent!.product.categoryId == '82' ||
        selectedComponent!.product.categoryId == '66') {
      products?.forEach((product) {
        // if (selectedComponent != null &&
        //     product.id == selectedComponent.product.id) {
        //   return;
        // }
        // Skip adding already selected products
        if (_selectedComponents?.values
                .any((selected) => selected.product.id == product.id) ??
            false) {
          return;
        }

        listWidget.add(ProductComponentItem(
            product: product,
            cpPerItemPricing: widget.cpPerItemPricing,
            isSelected: false,
            onSelected: (ProductVariation? variant) {
              var key = _component.id ?? '';
              var newItem = SelectedProductComponent(
                product: product,
                component: _component,
                quantity: 1,
                variant: variant,
                cpPerItemPricing: widget.cpPerItemPricing,
              );
              if (_selectedComponents == null) {
                _selectedComponents = {key: newItem};
              } else if (_selectedComponents!.containsKey(key)) {
                final id = generateUniqueId();
                _selectedComponents![id] = newItem;
                print("DUPPPPPP $id");
              } else {
                _selectedComponents![key] = newItem;
              }
              widget.onChanged?.call(_selectedComponents);
            },
            onChanged: (SelectedProductComponent selectedComponent) {
              _selectedComponents![selectedComponent.component.id ?? ''] =
                  selectedComponent;
              widget.onChanged?.call(_selectedComponents);
            },
            selectedComponent: _selectedComponents?[_component.id]));
        listWidget.add(const SizedBox(height: 5));
      });
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          margin: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight.withOpacity(0.7),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _component.name ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              if (_component.required)
                Text(
                  ' (*)',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.red),
                ),
              if (selectedComponent != null)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextButton.icon(
                    onPressed: () {
                      widget.selectedComponents?.clear();
                      // widget.selectedComponents?.remove(_component.id);
                      widget.onChanged?.call(widget.selectedComponents);
                    },
                    style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        backgroundColor: Theme.of(context).colorScheme.error),
                    icon: const Icon(
                      Icons.close,
                      size: 12,
                      color: Colors.white,
                    ),
                    label: Text(
                      S.of(context).clear,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Column(
            children: listWidget,
          ),
        ),
      ],
    );
  }

  String generateUniqueId() {
    return DateTime.now().microsecondsSinceEpoch.toString();
  }
}
