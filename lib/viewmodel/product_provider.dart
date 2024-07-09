import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hngshopapp/viewmodel/apiservice.dart';
 import '../model/product.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

  
final productProvider = FutureProvider<List<Product>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  final products = await apiService.fetchProducts();
  return products.map((productJson) => Product.fromJson(productJson)).toList();
});
