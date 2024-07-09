import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  
  final String baseUrl = 'https://api.timbu.cloud';

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/products?organization_id=${dotenv.env['ORG_ID']}&reverse_sort=false&page=1&size=10&Appid=${dotenv.env['APP_ID']}&Apikey=${dotenv.env['API_KEY']}'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['items'] != null && data['items'] is List) {
  return List<dynamic>.from(data['items']);
} else {
  throw Exception('No items found in the response');
}

 
    } else {
      throw Exception('Failed to load products');
    }
  }
}

