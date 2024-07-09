class Product {
  final String id;
  final String name;
  final String description;
final String imageUrl;
final double quantity;
 
    final double currentPrice;


  Product( {
    required this.imageUrl,
    required this.currentPrice,
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
   });

     factory Product.fromJson(Map<String, dynamic> json) {
   String imageUrl = '';
  double currentPrice = 0;

   if (json['photos'] != null && json['photos'].isNotEmpty) {
    imageUrl = json['photos'][0]['url'] ?? '';
  }

   if (json['current_price'] != null && json['current_price'].isNotEmpty) {
    currentPrice = double.tryParse(json['current_price'][0]['NGN'][0].toString()) ?? 0;
  }


    return Product(
      quantity: json['available_quantity'],
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description']??'', 
      imageUrl: imageUrl, currentPrice: currentPrice,
    );
  }
}
