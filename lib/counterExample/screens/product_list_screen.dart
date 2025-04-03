import 'package:flutter/material.dart';
import 'package:flutter_notes/counterExample/screens/cart_screen.dart';
import 'package:flutter_notes/models/cart_model.dart';
import 'package:flutter_notes/models/product_model.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Product> products = [
    Product(
      id: '1',
      title: 'Smart Watch',
      description: 'Latest smart watch with health monitoring',
      price: 199.99,
    ),
    Product(
      id: '2',
      title: 'Wireless Earbuds',
      description: 'High quality wireless earbuds with noise cancellation',
      price: 149.99,
    ),
    Product(
      id: '3',
      title: 'Phone Case',
      description: 'Durable protective case for smartphones',
      price: 29.99,
    ),
    Product(
      id: '4',
      title: 'Power Bank',
      description: '20000mAh portable charger with fast charging',
      price: 49.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text('Products'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${cart.items.length}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: const Icon(
                      Icons.shopping_bag,
                      size: 64,
                      color: Colors.brown,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Consumer<Cart>(
                        builder: (context, cart, child) {
                          final isInCart = cart.items.containsKey(product.id);
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isInCart ? Colors.red : Colors.blue,
                              ),
                              onPressed: () {
                                if (isInCart) {
                                  cart.removeFromCart(product.id);
                                } else {
                                  cart.addToCart(product);
                                }
                              },
                              child: Text(
                                isInCart ? 'Remove' : 'Add to Cart',
                                style: const TextStyle(
                                 color: Colors.white
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
