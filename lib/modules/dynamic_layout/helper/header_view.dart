import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import 'countdown_timer.dart';
import 'helper.dart';

class HeaderView extends StatelessWidget {
  final String? headerText;
  final VoidCallback? callback;
  final bool showSeeAll;
  final bool showCountdown;
  final Duration countdownDuration;
  final double? verticalMargin;
  final double? horizontalMargin;

  const HeaderView({
    this.headerText,
    this.showSeeAll = false,
    super.key,
    this.callback,
    this.verticalMargin = 18.0,
    this.horizontalMargin,
    this.showCountdown = false,
    this.countdownDuration = const Duration(),
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var isDesktop = Layout.isDisplayDesktop(context);

    return SizedBox(
      width: screenSize.width,
      child: Container(
        color: Colors.black,
        // color: Theme.of(context).colorScheme.surface,
        margin: EdgeInsets.only(top: verticalMargin!),
        padding: EdgeInsets.only(
          left: horizontalMargin ?? 16.0,
          top: verticalMargin!,
          right: horizontalMargin ?? 8.0,
          bottom: verticalMargin!,
        ),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // if (isDesktop) ...[
                  //   const SizedBox(height: 16),
                  // ],
                  // Text(
                  //   headerText ?? '',
                  //   style: isDesktop
                  //       ? Theme.of(context)
                  //           .textTheme
                  //           .headlineSmall!
                  //           .copyWith(fontWeight: FontWeight.w700)
                  //       : Theme.of(context).textTheme.titleLarge,
                  // ),
                  const Text(
                    'Choose Your Meal Type to Start Your Order',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  if (showCountdown)
                    Row(
                      children: [
                        Text(
                          S.of(context).endsIn('').toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.8),
                              )
                              .apply(fontSizeFactor: 0.6),
                        ),
                        CountDownTimer(countdownDuration),
                      ],
                    ),
                  if (isDesktop) const SizedBox(height: 8),
                ],
              ),
            ),
            // if (showSeeAll)
            //   InkResponse(
            //     onTap: callback,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text(
            //         S.of(context).seeAll,
            //         style: Theme.of(context)
            //             .textTheme
            //             .bodySmall!
            //             .copyWith(color: Theme.of(context).primaryColor),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
