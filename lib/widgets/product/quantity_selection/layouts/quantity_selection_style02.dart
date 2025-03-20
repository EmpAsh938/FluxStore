import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspireui/extensions.dart';

import '../../../../common/tools/flash.dart';
import '../quantity_selection_state_ui.dart';

class QuantitySelectionStyle02 extends StatelessWidget {
  const QuantitySelectionStyle02(
    this.stateUI, {
    super.key,
    this.onShowOption,
    this.colorButtonAdd,
    this.colorButtonSub,
  });

  final QuantitySelectionStateUI stateUI;
  final void Function()? onShowOption;
  final Color? colorButtonAdd;
  final Color? colorButtonSub;

  @override
  Widget build(BuildContext context) {
    var isLockAdd = stateUI.currentQuantity + 1 > stateUI.limitSelectQuantity;
    var isLockSub = stateUI.currentQuantity - 1 < 1;

    final colorRoot = Theme.of(context).primaryColor;
    final colorBgAdd =
        colorButtonAdd ?? colorRoot.withOpacity(isLockAdd ? 0.1 : 0.3);
    final colorBgSub = colorButtonSub ?? colorRoot.withOpacity(0.08);

    final iconPadding = EdgeInsets.all(
      max(
        ((stateUI.height) - 24.0 - 8) * 0.5,
        0.0,
      ),
    );

    final enableTextBox = stateUI.enabled == true && stateUI.enabledTextBox;

    final textField = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: enableTextBox ? null : onShowOption,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: stateUI.height,
        width: stateUI.expanded == true ? null : stateUI.width,
        // decoration: BoxDecoration(
        //   border: Border.all(width: 1.0, color: kGrey200),
        //   borderRadius: BorderRadius.circular(6),
        // ),
        alignment: Alignment.center,
        child: Center(
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            focusNode: stateUI.focusNode,
            readOnly:
                stateUI.enabled == false || stateUI.enabledTextBox == false,
            enabled: enableTextBox,
            controller: stateUI.textController,
            maxLines: 1,
            maxLength: '${stateUI.limitSelectQuantity}'.length,
            onChanged: (_) => stateUI.onQuantityChanged(),
            onSubmitted: (_) => stateUI.onQuantityChanged(),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              counterText: '',
              isDense: true, // Required for text centering
            ),
            style: Theme.of(context).textTheme.bodySmall,
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: false,
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

    return Row(
      mainAxisSize: stateUI.expanded ? MainAxisSize.max : MainAxisSize.min,
      children: [
        stateUI.enabled == true
            ? Container(
                height: stateUI.height,
                width: stateUI.height,
                decoration: BoxDecoration(
                  color: colorBgSub,
                  borderRadius: BorderRadius.circular(stateUI.height),
                ),
                child: IconButton(
                  padding: iconPadding,
                  onPressed: isLockSub
                      ? null
                      : () {
                          if (stateUI.focusNode?.hasFocus ?? false) {
                            stateUI.focusNode?.unfocus();
                          }
                          stateUI.changeQuantity(stateUI.currentQuantity - 1);
                        },
                  icon: Icon(
                    Icons.remove,
                    size: 18,
                    color: colorButtonSub != null
                        ? colorButtonSub!.getColorBasedOnBackground
                        : colorRoot.withOpacity(isLockSub ? 0.3 : 1),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        stateUI.expanded == true
            ? Expanded(
                child: textField,
              )
            : textField,
        stateUI.enabled == true
            ? Container(
                height: stateUI.height,
                width: stateUI.height,
                decoration: BoxDecoration(
                  color: colorBgAdd,
                  borderRadius: BorderRadius.circular(stateUI.height),
                ),
                child: IconButton(
                  padding: iconPadding,
                  onPressed: () {
                    if (isLockAdd) {
                      FlashHelper.errorBar(
                        context,
                        message:
                            'Maximum can only choose ${stateUI.limitSelectQuantity} products.',
                      );
                      return;
                    }

                    if (stateUI.focusNode?.hasFocus ?? false) {
                      stateUI.focusNode?.unfocus();
                    }
                    stateUI.changeQuantity(stateUI.currentQuantity + 1);
                  },
                  icon: Icon(
                    Icons.add,
                    size: 18,
                    color: colorButtonAdd != null
                        ? colorButtonAdd!.getColorBasedOnBackground
                        : colorRoot.withOpacity(isLockAdd ? 0.3 : 1),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class QuantitySelectionStyle04 extends StatelessWidget {
  const QuantitySelectionStyle04(
    this.stateUI, {
    super.key,
    this.onShowOption,
    this.colorButtonAdd,
    this.colorButtonSub,
  });

  final QuantitySelectionStateUI stateUI;
  final void Function()? onShowOption;
  final Color? colorButtonAdd;
  final Color? colorButtonSub;

  @override
  Widget build(BuildContext context) {
    var isLockAdd = stateUI.currentQuantity + 1 > stateUI.limitSelectQuantity;
    var isLockSub = stateUI.currentQuantity - 1 < 1;

    final colorRoot = Theme.of(context).primaryColor;
    final colorBgAdd =
        colorButtonAdd ?? colorRoot.withOpacity(isLockAdd ? 0.1 : 0.3);
    final colorBgSub = colorButtonSub ?? colorRoot.withOpacity(0.08);

    final iconPadding = EdgeInsets.all(
      max(
        ((stateUI.height) - 24.0 - 8) * 0.5,
        0.0,
      ),
    );

    final enableTextBox = stateUI.enabled == true && stateUI.enabledTextBox;

    final textField = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: enableTextBox ? null : onShowOption,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Center(
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            focusNode: stateUI.focusNode,
            readOnly:
                stateUI.enabled == false || stateUI.enabledTextBox == false,
            enabled: enableTextBox,
            controller: stateUI.textController,
            maxLines: 1,
            maxLength: '${stateUI.limitSelectQuantity}'.length,
            onChanged: (_) => stateUI.onQuantityChanged(),
            onSubmitted: (_) => stateUI.onQuantityChanged(),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              counterText: '',
              isDense: true, // Required for text centering
            ),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white,fontSize: 15),
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: false,
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

    return Container(
      color: Colors.white,
      child: Row(
        mainAxisSize: stateUI.expanded ? MainAxisSize.max : MainAxisSize.min,
        children: [
          stateUI.enabled == true
              ? Container(
                  height: stateUI.height,
                  width: stateUI.height,
                  decoration: BoxDecoration(
                    color: colorBgSub,
                    borderRadius: BorderRadius.circular(stateUI.height),
                  ),
                  child: IconButton(
                    padding: iconPadding,
                    onPressed: isLockSub
                        ? null
                        : () {
                            if (stateUI.focusNode?.hasFocus ?? false) {
                              stateUI.focusNode?.unfocus();
                            }
                            stateUI.changeQuantity(stateUI.currentQuantity - 1);
                          },
                    icon: const Icon(
                      Icons.remove,
                      size: 18,
                      color: Colors.black,
                      // color: colorButtonSub != null
                      //     ? colorButtonSub!.getColorBasedOnBackground
                      //     : colorRoot.withOpacity(isLockSub ? 0.3 : 1),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          stateUI.expanded == true
              ? Expanded(
                  child: textField,
                )
              : textField,
          stateUI.enabled == true
              ? Container(
                  height: stateUI.height,
                  width: stateUI.height,
                  decoration: BoxDecoration(
                    color: colorBgSub,
                    // color: colorBgAdd,
                    borderRadius: BorderRadius.circular(stateUI.height),
                  ),
                  child: IconButton(
                    padding: iconPadding,
                    onPressed: () {
                      if (isLockAdd) {
                        FlashHelper.errorBar(
                          context,
                          message:
                              'Maximum can only choose ${stateUI.limitSelectQuantity} products.',
                        );
                        return;
                      }

                      if (stateUI.focusNode?.hasFocus ?? false) {
                        stateUI.focusNode?.unfocus();
                      }
                      stateUI.changeQuantity(stateUI.currentQuantity + 1);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 18,
                      // color: colorButtonAdd != null
                      //     ? colorButtonAdd!.getColorBasedOnBackground
                      //     : colorRoot.withOpacity(isLockAdd ? 0.3 : 1),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
