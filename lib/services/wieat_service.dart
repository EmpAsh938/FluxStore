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
              '4k8Ov3_phkmbAkrayOX3_Q.vDlqipVDFVlxO8qn54A84kpViSP9F6l53s4qOLo0crg',
          'address': address,
        }),
      );

      if (response.statusCode == 200) {
        print('BranchId ${branchId} address ${address}');
        print(response.body);
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch cost: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Wieat cost: $e');
    }
  }
}
