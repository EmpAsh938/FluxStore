// Enable Audio feature
// import 'package:flux_audio/index.dart';
import 'package:flux_extended/index.dart';
import 'package:flux_firebase/firebase_notification_service.dart';

import '../common/config.dart';
import '../common/constants.dart';
import '../frameworks/woocommerce/services/woo_mixin.dart';
import '../frameworks/wordpress/services/wordpress_mixin.dart';
import '../modules/advertisement/index.dart' show AdvertisementServiceImpl;
import '../modules/digits_mobile_login/services/digits_mobile_login_service_mixin.dart';
import '../modules/onesignal/one_signal_notification_service.dart';
import '../modules/tera_wallet/services/wallet_service_mixin.dart';
import '../modules/wholesale/services/wholesale_service_mixin.dart';
import 'advertisement/advertisement_service.dart';
import 'chat/all_chat_services.dart';
import 'firebase_service.dart';
import 'notification/notification_service.dart';
import 'notification/notification_service_impl.dart';
import 'service_config.dart';

export 'base_remote_config.dart';

class Services
    with
        ConfigMixin,
        WooMixin,
        WordPressMixin,
        BookingServiceMixin,
        NativePaymentServiceMixin,
        WalletServiceMixin,
        PaidMembershipProServiceMixin,
        MembershipUltimateServiceMixin,
        WholesaleServiceMixin,
        B2BKingServiceMixin,
        DigitsMobileLoginServiceMixin,
        InAppPurchaseMixin,
        OpenAIServiceMixin,
        StoreLocatorServiceMixin {
  static final Services _instance = Services._internal();

  factory Services() => _instance;

  Services._internal();

  /// using BaseFirebaseServices when disable the Firebase
  // final firebase = BaseFirebaseServices();
  final firebase = FirebaseServices();

  /// using AdvertisementService when disable the Advertisement
  // final AdvertisementService advertisement = AdvertisementService();
  final AdvertisementService advertisement = AdvertisementServiceImpl();

  final ChatServices chatServices = ChatServices();

  /// Get notification Service
  static NotificationService getNotificationService() {
    NotificationService notificationService = NotificationServiceImpl();
    if (isIos || isAndroid) {
      if (kOneSignalKey['enable'] ?? false) {
        notificationService =
            OneSignalNotificationService(appID: kOneSignalKey['appID']);
      } else {
        if (_instance.firebase.isEnabled) {
          notificationService = FirebaseNotificationService();
        }
      }
    }
    return notificationService;
  }
}
