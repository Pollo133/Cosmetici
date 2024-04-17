import 'package:cosmetici_2/prodotto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ShowProducts extends StatefulWidget{

  //ShowProducts({super.key, required this.productType});
  ShowProducts({Key? key, this.productType}) : super(key: key);


  String? productType;

  @override
  _ShowProductsState createState() => _ShowProductsState();
}
class _ShowProductsState extends State<ShowProducts> {

  List<Prodotto> products = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prodotti Lista", style: TextStyle(color: Colors.white)), backgroundColor: Colors.purple,),
      body:
      ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: Color(0x3600000F),
                    offset: Offset(0, 2))
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            product.imageLink!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              //product.name)
                                "Nome")
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            //"${product.price}"
                              "Prezzo"

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


//button navigation bar flutter
//segmented button flutter

  Future findProduct(String productType) async{

    const dominio = 'makeup-api.herokuapp.com';
    const percorsoFile = '/api/v1/products.json';

    Map<String, dynamic> parametri = {'product_type': productType}; //dynamic perchè non so che variabile passo
    Uri uri = Uri.https(dominio, percorsoFile, parametri);
    //print(uri);
    http.get(uri).then((result) {
      final productsMap = json.decode(result.body);
      final productsMapItems = productsMap['items'];

      //print(result.body);
      setState(() {
        products = productsMapItems.map<Prodotto>((var productMap) => Prodotto.fromJson(productMap)).toList();
        this.products = products;
      });

      //Navigator.push(context, MaterialPageRoute(builder: (context) => ShowProducts(products: products),),);

    });
  }}