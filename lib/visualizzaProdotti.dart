import 'package:cosmetici_2/prodotto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'categoria.dart';
import 'main.dart';

class ShowProducts extends StatelessWidget{
  ShowProducts({super.key, required this.prodotti});
  List<Prodotto> prodotti = [];

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