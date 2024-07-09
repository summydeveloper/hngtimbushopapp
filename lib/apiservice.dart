import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey =
      '504b6f7e3d9845e19eaa81d81eb363e920240707172334490359';
  final String baseUrl = 'https://api.timbu.cloud';

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/products?organization_id=e1b561f372de4dfdbf7187b4d41c58d9&reverse_sort=false&page=1&size=10&Appid=XRC8VOVL8Q8A6QV&Apikey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['items']);
      print(response.statusCode);
      if (data['items'] != null && data['items'] is List) {
  return List<dynamic>.from(data['items']);
} else {
  throw Exception('No items found in the response');
}

      // if (data['items'] != null) {
      //   return List<dynamic>.from(data['items']);
      // } else {
      //   throw Exception('No items found in the response');
      // }
    } else {
      throw Exception('Failed to load products');
    }
  }
}

