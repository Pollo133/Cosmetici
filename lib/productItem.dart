
import 'package:cosmetici/prodotto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProductItem extends StatelessWidget {
  final Prodotto product;

  ProductItem({required this.product});

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
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 4.0),
          // Product category
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Category: ${product.productType}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 4.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${product.price}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

