import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as webview;

class StoreLocator extends StatelessWidget {
  const StoreLocator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = webview.WebViewController()
      ..setJavaScriptMode(webview.JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        webview.NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (webview.WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('https://staging2.hakkaexpress.com/storelocator/'));
      // ..loadRequest(Uri.parse('https://hakkaexpress.com/storelocator/'));
    return Scaffold(
      body: webview.WebViewWidget(controller: controller),
    );
  }
}
