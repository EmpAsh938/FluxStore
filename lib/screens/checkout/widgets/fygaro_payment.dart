import 'package:url_launcher/url_launcher.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class FygaroPayment {
  static void launchPayment({
    required String kid,
    required double amount,
    required String currency,
    required String orderId,
  }) async {
    final redirectUrl = 'com.inspireui.fluxstore://payment_success';
    const String baseUrl =
        'https://www.fygaro.com/en/pb/a9e1f8bb-58f4-495d-acc8-76ebf97d9d6c/'; // Replace with your Fygaro button ID
    final token = generateFygaroJWT(
        kid: kid,
        amount: amount,
        currency: currency,
        customReference: 'customReference',
        secretKey: 'rbzmCZfQtAADgGNA_4cLb9CXtY2jSNN5NxBawVEOjFo');
    final Uri paymentUrl =
        Uri.parse('$baseUrl?jwt=$token&redirect_url=$redirectUrl');

    if (await canLaunchUrl(paymentUrl)) {
      await launchUrl(paymentUrl, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $paymentUrl';
    }
  }

  static String generateFygaroJWT({
    required String kid,
    required double amount,
    required String currency,
    required String customReference,
    required String secretKey,
  }) {
    // Generate expiration (exp) and not before (nbf) timestamps
    final int exp =
        DateTime.now().add(Duration(minutes: 30)).millisecondsSinceEpoch ~/
            1000; // 30 min expiry
    final int nbf =
        DateTime.now().millisecondsSinceEpoch ~/ 1000; // Token valid from now

    // Create the JWT
    final jwt = JWT(
      {
        "amount": amount.toStringAsFixed(2),
        "currency": currency,
        "custom_reference": customReference,
        "exp": exp,
        "nbf": nbf,
      },
      header: {
        "alg": "HS256",
        "typ": "JWT",
        "kid": kid, // Your Fygaro Key ID
      },
    );

    // Sign the token using HMAC SHA256
    return jwt.sign(SecretKey(secretKey), algorithm: JWTAlgorithm.HS256);
  }
}
