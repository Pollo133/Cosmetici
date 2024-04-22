import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'prodotto.dart';


class ShowDetails extends StatelessWidget{
  Prodotto product;
  ShowDetails({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              launchUrl(product.productLink);
            },
          ),
        ],
        backgroundColor: Colors.purple,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  constraints: BoxConstraints(maxWidth: 800), // Limit max width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product.imageLink,
                          height: constraints.maxHeight * 0.4,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: constraints.maxHeight * 0.041,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Colors",
                        style: TextStyle(
                          fontSize: constraints.maxHeight * 0.027,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                    if (product.colori.isNotEmpty) ...[
                      Wrap(
                        spacing: 10,
                        runSpacing: 15,
                        children: [
                          for (int i = 0; i < product.colori.length; i++)
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: hexToColor(product.colori[i]),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      )],
                      SizedBox(height: 20),
                    if (product.description.isNotEmpty) ...[
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: constraints.maxHeight * 0.027,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        product.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: constraints.maxHeight * 0.022),
                      ),],
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          launchUrl(product.productLink);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30,
                          ),
                          child: Text("Buy"),
                        ),
                      ),

                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


Color hexToColor(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

Future<void> launchUrl(productLink) async {
  if (!await launch(productLink)) {
    throw Exception('Could not launch $productLink');
  }
}


