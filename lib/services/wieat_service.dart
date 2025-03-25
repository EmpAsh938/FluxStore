import 'dart:convert';

import 'package:http/http.dart' as http;

class WieatService {
  final baseUrl = 'https://hakkaexpress.com/wp-json/custom/v1/calculate-fare';
  Future<Map<String, dynamic>> getWieatCost(
      String branchId, String address) async {
    try {
      final url = Uri.parse(baseUrl);
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'branch_id': branchId,
          'api_key':
              '5NFcnuO06EqB7f9IpOfxTQ.Th18_DRlU01MqL-lzCnXXxtShYWUkSh_wBk2nUu2IWI',
          'address': address,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch cost: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Wieat cost: $e');
    }
  }
}
