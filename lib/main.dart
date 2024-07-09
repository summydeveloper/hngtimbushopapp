import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product.dart';
import 'river_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timbu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Product>> productAsyncValue = ref.watch(productProvider);

    return Scaffold(
       appBar: AppBar(
          title: Text('Products'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
              },
            ),
          ],
        ),
        body: ProductList(),
    );
  }
}


class ProductList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productProvider);

    return productsAsyncValue.when(
      data: (products) {
        return GridView.builder(
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: product.imageUrl.isNotEmpty?  Image.network(
               'https://api.timbu.cloud/images/${product.imageUrl}',
                fit: BoxFit.cover,
              ): Placeholder(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),
                Text(
                  'NGN ${product.currentPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                                SizedBox(height: 2.0),

                 Text(
                      'Quantity: ${product.quantity.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ],
            ),
          ),
          TextButton(onPressed:(){
            print('pressed');
            Placeholder(
              child: Text(product.description),
            );
          }, child: Text('Read More'), ),
        ],
      ),
    );
  }
}
