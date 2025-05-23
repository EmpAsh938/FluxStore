import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart'
    as core;
import 'package:fwfh_cached_network_image/fwfh_cached_network_image.dart';
// import 'package:fwfh_chewie/fwfh_chewie.dart';
import 'package:fwfh_svg/fwfh_svg.dart';
import 'package:fwfh_url_launcher/fwfh_url_launcher.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

class HtmlWidget extends StatelessWidget {
  final String html;
  final TextStyle? textStyle;
  final core.CustomWidgetBuilder? customWidgetBuilder;
  final int? maxLines;

  /// Returns `true` if the url has been handled,
  /// the default handler will be skipped.
  final FutureOr<bool> Function(String)? onTapUrl;

  const HtmlWidget(
    this.html, {
    super.key,
    this.textStyle,
    this.customWidgetBuilder,
    this.maxLines,
    this.onTapUrl,
  });

  @override
  Widget build(BuildContext context) {
    var textStyleVal = textStyle ?? Theme.of(context).textTheme.bodyLarge;
    var htmlVal = html;

    if (maxLines != null) {
      // Only support display an ellipsis (...) for text overflow
      htmlVal =
          '<div style="max-lines: $maxLines; text-overflow: ellipsis">$htmlVal</div>';
    }

    /// Replace some tag that cause messy HTML render
    htmlVal = htmlVal
        .replaceAll('src="//', 'src="https://')
        .replaceAll('<figure', '<span')
        .replaceAll('</figure>', '<span>');

    return core.HtmlWidget(
      htmlVal ?? '',
      textStyle: textStyleVal,
      factoryBuilder: MyWidgetFactory.new,
      customWidgetBuilder: customWidgetBuilder,
      onTapUrl: onTapUrl,
    );
  }
}

class MyWidgetFactory extends core.WidgetFactory
    with
        WebViewFactory,
        CachedNetworkImageFactory,
        UrlLauncherFactory,
        // ChewieFactory,
        SvgFactory {
  @override
  bool get webViewMediaPlaybackAlwaysAllow => true;
}
