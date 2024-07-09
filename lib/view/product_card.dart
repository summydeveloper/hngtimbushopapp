import 'package:flutter/material.dart';
import 'package:hngshopapp/model/product.dart';


class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: product.imageUrl.isNotEmpty?  Image.network(
               'https://api.timbu.cloud/images/${product.imageUrl}',
                fit: BoxFit.cover,
              ): const Placeholder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'NGN ${product.currentPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                                const SizedBox(height: 2.0),

                 Text(
                      'Quantity: ${product.quantity.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ],
            ),
          ),
          TextButton(onPressed:(){
           // Navigator.push();
            Placeholder(
              child: Text(product.description),
            );
          }, child: const Text('Read More'), ),
        ],
      ),
    );
  }
}
