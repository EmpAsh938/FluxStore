import 'package:flutter/material.dart';

import 'expansion_tile.dart';

class ExpansionInfo extends StatelessWidget {
  final String title;
  final Widget? titleWidget;
  final bool expand;
  final List<Widget> children;
  final Widget? subTitle;

  const ExpansionInfo({
    this.title = '',
    this.titleWidget,
    required this.children,
    this.expand = false,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ConfigurableExpansionTile(
      initiallyExpanded: expand,
      bottomBorderOn: false,
      topBorderOn: false,
      headerExpanded: Flexible(
        child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight.withOpacity(0.7),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 10),
            child: titleWidget ??
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      if (subTitle != null) subTitle!,
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 20,
                      ),
                    ])),
      ),
      header: Flexible(
        child: titleWidget ??
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight.withOpacity(0.5),
                borderRadius: BorderRadius.circular(6),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    title.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  if (subTitle != null) subTitle!,
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 20,
                  )
                ],
              ),
            ),
      ),
      children: children,
    );
  }
}
