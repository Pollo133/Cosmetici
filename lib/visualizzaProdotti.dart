import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
          // Product image
          Container(
            height: 150.0, // Altezza dell'immagine
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.imageLink),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          SizedBox(height: 8.0),
          // Product name
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 4.0),
          // Product category
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Category: ${product.category}',
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
/*
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
padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
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
padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
child: Row(
mainAxisSize: MainAxisSize.max,
children: [
Padding(
padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
child: Text(
//product.name)
"Nome")
),
],
),
),
Padding(
padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
child: Row(
mainAxisSize: MainAxisSize.max,
children: [
Padding(
padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
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
),*/
