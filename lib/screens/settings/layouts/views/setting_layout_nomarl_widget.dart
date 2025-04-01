import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart' as webview;

import '../../../../common/constants.dart';
import '../../../../generated/l10n.dart';
import '../../../../models/index.dart';
import '../../../../models/user_model.dart';
import '../../../common/delete_account_mixin.dart';
import '../../widgets/setting_item/setting_item_widget.dart';
import '../mixins/branch_mixin.dart';
import '../mixins/setting_nomarl_mixin.dart';
import '../setting_builder_layout.dart';

class SettingLayoutNormalWidget extends StatefulWidget {
  const SettingLayoutNormalWidget({
    super.key,
    required this.dataSettings,
  });

  final DataSettingScreen dataSettings;

  @override
  State<SettingLayoutNormalWidget> createState() =>
      _SettingLayoutNormalWidgetState();
}

class _SettingLayoutNormalWidgetState extends State<SettingLayoutNormalWidget>
    with DeleteAccountMixin, SettingNormalMixin, BranchMixin {
  @override
  DataSettingScreen get dataSettings => widget.dataSettings;

  @override
  BuildContext get buildContext => context;

  @override
  ScrollController get scrollController => PrimaryScrollController.of(context);

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context, listen: false);
    final jwtToken = userModel.user!.jwtToken;
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        appBarWidget,
        // Items
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // UserInfo
                    if (userInfoWidget != null)
                      userInfoWidget!
                    else
                      const SizedBox(height: 30.0),

                    Text(
                      S.of(context).generalSetting,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
              Container(
                margin: marginHorizontalItemDynamic,
                decoration: decoration,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Vendor
                    vendorAdminWidget,

                    /// Branch
                    branchWidget,

                    /// Render some extra menu for Vendor.
                    /// Currently support WCFM & Dokan. Will support WooCommerce soon.
                    ...someExtraMenuForVendorWidget,

                    deliveryBoyWidget,

                    /// Render custom Wallet feature
                    // webViewProfileWidget,

                    /// render some extra menu for Listing
                    ...settingListingWidget,

                    /// render list of dynamic menu
                    /// this could be manage from the Fluxbuilder
                    ...listDynamicItems,

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: SettingItemWidget(
                        iconWidget: const Icon(Icons.track_changes_outlined),
                        title: 'Live Tracking',
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: kGrey600,
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  WebViewScreen(token: jwtToken!)));
                        },
                      ),
                    ),

                    /// Delete account
                    if (deleteAccountItem != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: itemPadding),
                        child: deleteAccountItem,
                      ),
                  ],
                ),
              ),
              if (logoutItemWidget != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 20),
                  child: logoutItemWidget,
                ),
              const SizedBox(height: 180),
            ],
          ),
        ),
      ],
    );
  }
}

class WebViewScreen extends StatefulWidget {
  final String token;
  const WebViewScreen({super.key, required this.token});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late webview.WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = webview.WebViewController()
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
      ..loadRequest(Uri.parse(
          'https://hakkaexpress.com/my-account/orders/?token=${widget.token}'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: webview.WebViewWidget(controller: controller),
      ),
    );
  }
}
