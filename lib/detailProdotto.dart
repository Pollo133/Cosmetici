import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // aggiornare le dipendenze con url_launcher:
import 'prodotto.dart';


class ShowDetails extends StatelessWidget{

  Prodotto product;
  ShowDetails({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(product.name, style: TextStyle(color: Colors.white),),
          IconButton(icon: Icon(Icons.shopping_cart),
            onPressed: () {launchUrl(product.productLink);},),],),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child:
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    SizedBox(height: 10),
                    ClipRRect(borderRadius: BorderRadius.circular(10),
                      child: Image.network(product.imageLink,height: MediaQuery.sizeOf(context).height * 0.4,),),
                    if (product.colori.isNotEmpty) ...[
                      SizedBox(height: 20),
                      Text("Colors", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 15,
                        children: [
                          for (int i = 0; i < product.colori.length; i++)
                            Container(
                              height: 35,
                              width: 35,
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
                      ),],
                    SizedBox(height: 10),
                  ],),),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              launchUrl(product.productLink);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                              child: Text("Buy"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      if (product.description.isNotEmpty) ...[
                        Text(
                          "Description",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              product.description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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