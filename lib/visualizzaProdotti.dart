
import 'package:cosmetici/prodotto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailProdotto.dart';
import 'productItem.dart';


class ShowProducts extends StatelessWidget{

  List<Prodotto> products;
  ShowProducts({super.key, required this.products});
  //ShowProducts({Key? key, this}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(products[0]);
    return Scaffold(
      appBar: AppBar(title: const Text("Cosmetici", style: TextStyle(color: Colors.white)), backgroundColor: Colors.purple,),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0, // Larghezza massima per ogni elemento
          mainAxisSpacing: 10.0, // Spazio tra le righe
          crossAxisSpacing: 10.0, // Spazio tra le colonne
          childAspectRatio: 0.75, // Rapporto tra altezza e larghezza di ogni elemento
        ),
        padding: EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShowDetails(product: products[index])));
            },
            child: ProductItem(
              product: products[index],
            ),
          );
        },
      ),
    );
  }
}

//button navigation bar flutter
//segmented button flutter

/*Future findProduct(String productType) async{

  const dominio = 'makeup-api.herokuapp.com';
  const percorsoFile = '/api/v1/products.json';

  Map<String, dynamic> parametri = {'product_type': productType}; //dynamic perchè non so che variabile passo
  Uri uri = Uri.https(dominio, percorsoFile, parametri);
  //print(uri);
  http.get(uri).then((result) {
    final productsMap = json.decode(result.body);


      //print(result.body);
    setState(() {
      products = productsMap.map<Prodotto>((var productMap) => Prodotto.fromJson(productMap)).toList();
      this.products = products;
    });

      //Navigator.push(context, MaterialPageRoute(builder: (context) => ShowProducts(products: products),),);

  });
}*/
