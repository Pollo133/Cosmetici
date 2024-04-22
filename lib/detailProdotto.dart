import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'prodotto.dart';


class ShowDetails extends StatelessWidget{
  Prodotto product;
  ShowDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    NetworkImage image = NetworkImage(product.imageLink);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
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
                  padding: const EdgeInsets.all(20),
                  constraints: const BoxConstraints(maxWidth: 800), // Limit max width
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                          Image(image: image, height: constraints.maxHeight * 0.4,),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "${product.name} - ${product.brand}",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.041,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (product.colori.isNotEmpty) ...[
                          Text(
                            "Colors",
                            style: TextStyle(
                              fontSize: constraints.maxHeight * 0.027,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
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
                        const SizedBox(height: 20),
                        if (product.description.isNotEmpty) ...[
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: constraints.maxHeight * 0.027,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: constraints.maxHeight * 0.022),
                          ),],
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            launchUrl(product.productLink);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30,
                            ),
                            child: Text("Buy"),
                          ),
                        ),
                      ]
                  ),
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