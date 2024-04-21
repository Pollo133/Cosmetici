import 'package:flutter/material.dart';
import 'prodotto.dart';


class ProductItem extends StatelessWidget {
  final Prodotto product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.imageLink),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4.0),
          // Product category
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Category: ${product.productType}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${product.price}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}