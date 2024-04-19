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
        appBar: AppBar(title: const Text("Cosmetici", style: TextStyle(color: Colors.white)),
    actions: [IconButton(icon: Icon(Icons.filter_list),
    onPressed: () {showFilterDialog(context);},),],
    backgroundColor: Colors.purple,),
    body:
    GridView.builder(
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
    ),);

  }
}
void showFilterDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ExpansionPanelList(
              elevation: 0,
              dividerColor: Colors.transparent,
              expandedHeaderPadding: EdgeInsets.all(0),
              expansionCallback: (int index, bool isExpanded) {},
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Price'),
                    );
                  },
                  body: Column(
                    children: [
                      Slider(
                        min: 0,
                        max: 200,
                        divisions: 20,
                        label: 'Price',
                        onChanged: (value) {
                          // Gestisci il valore dello slider per il prezzo
                        },
                        value: 100, // Valore predefinito
                      ),
                    ],
                  ),
                  isExpanded: true,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Category'),
                    );
                  },
                  body: Column(
                    children: [
                      // Aggiungi qui un dropdown o altri controlli per selezionare la categoria
                    ],
                  ),
                  isExpanded: false,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Brand'),
                    );
                  },
                  body: Column(
                    children: [
                      // Aggiungi qui un dropdown o altri controlli per selezionare il brand
                    ],
                  ),
                  isExpanded: false,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
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
