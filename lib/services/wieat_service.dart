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
          // 'drop_off_address': 'trinidad',
          // "drop_off_latitude": "37.4219983",
          // "drop_off_longitude": "-122.084"
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
