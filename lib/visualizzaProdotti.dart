import 'package:cosmetici/prodotto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'categoria.dart';
import 'main.dart';

class ShowProducts extends StatefulWidget{
  const ShowProducts({super.key, required String categoria});

  @override
  State<ShowProducts> createState() => _ShowProductsState();

}

class _ShowProductsState extends State<ShowProducts>{

  Widget build(BuildContext context) {

    find



    return Expanded(child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Scaffold(
        appBar: AppBar(title: Text("Ciao")) ,
        body: ,
      ),
    ));
  }
}




/*
class ShowProducts extends StatelessWidget{
  ShowProducts({super.key, required String categoria});
  List<Prodotto> products = [];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cosmetici", style: TextStyle(color: Colors.white)), backgroundColor: Colors.purple,),
        body: Column(children: [
          Expanded(child: ListView.builder(
            itemCount: prodotti.length,

            itemBuilder: (context, index){
              return ListTile(
                leading: Image.network(prodotti[index].imageLink!), // Immagine
                title: Text(
                  prodotti[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${prodotti[index].id}'),
                    Text('Categoria: ${prodotti[index].category}'),
                    Text(''),
                  ],
                ),
                trailing: Icon(Icons.add_circle),
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => xxx(libro: libri[index])));
                },
              );
            },
          ),

          )


        ]));

  }}


//button navigation bar flutter
//segmented button flutter


 */